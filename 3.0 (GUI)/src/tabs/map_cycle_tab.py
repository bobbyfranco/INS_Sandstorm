from __future__ import annotations
import os
from typing import Callable
from PyQt5.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QPlainTextEdit,
    QPushButton, QCheckBox, QLabel, QMessageBox,
)
from ..state import LauncherState, FILE_MAP_CYCLE
from ..data import generate_map_cycle_lines


class MapCycleTab(QWidget):
    def __init__(self, state: LauncherState, on_change: Callable):
        super().__init__()
        self._state = state
        self._on_change = on_change
        self._build_ui()
        self.load_from_state()

    def _build_ui(self):
        layout = QVBoxLayout(self)

        layout.addWidget(QLabel("Map Cycle (one entry per line - edit freely before saving):"))

        self._editor = QPlainTextEdit()
        self._editor.setPlaceholderText(
            "Click 'Generate from Gamemode' to populate, or load an existing file."
        )
        layout.addWidget(self._editor)

        top_row = QHBoxLayout()
        self._night = QCheckBox("Include night versions")
        top_row.addWidget(self._night)

        gen_btn = QPushButton("Generate from Gamemode")
        gen_btn.clicked.connect(self._generate)
        top_row.addWidget(gen_btn)
        top_row.addStretch()
        layout.addLayout(top_row)

        bottom_row = QHBoxLayout()
        self._use_cycle = QCheckBox("Use -MapCycle in launch command")
        self._use_cycle.stateChanged.connect(self._sync_toggle)
        bottom_row.addWidget(self._use_cycle)
        bottom_row.addStretch()

        load_btn = QPushButton("Load MapCycle.txt")
        load_btn.clicked.connect(self._load)
        bottom_row.addWidget(load_btn)

        save_btn = QPushButton("Save MapCycle.txt")
        save_btn.clicked.connect(self._save)
        bottom_row.addWidget(save_btn)
        layout.addLayout(bottom_row)

    def _generate(self):
        lines = generate_map_cycle_lines(
            self._state.gamemode_idx, self._state.team, self._night.isChecked()
        )
        if not lines:
            QMessageBox.information(self, "No Maps",
                                    "No maps available for the selected gamemode.")
            return
        self._editor.setPlainText("\n".join(lines))

    def _sync_toggle(self):
        self._state.use_map_cycle = self._use_cycle.isChecked()
        self._on_change()

    def _load(self):
        if not self._state.exe_path:
            QMessageBox.warning(self, "No Exe Path",
                                "Set the server exe path in the Server tab first.")
            return
        path = self._state.config_file(FILE_MAP_CYCLE)
        if not os.path.exists(path):
            QMessageBox.information(self, "Not Found", f"No file found at:\n{path}")
            return
        with open(path, "r", encoding="utf-8") as f:
            self._editor.setPlainText(f.read())

    def _save(self):
        if not self._state.exe_path:
            QMessageBox.warning(self, "No Exe Path",
                                "Set the server exe path in the Server tab first.")
            return
        content = self._editor.toPlainText().strip()
        if not content:
            QMessageBox.warning(self, "Empty",
                                "Map cycle is empty. Generate or load content first.")
            return
        path = self._state.config_file(FILE_MAP_CYCLE)
        config_dir = os.path.dirname(path)
        exists = os.path.exists(path)
        detail = "This will overwrite the existing file." if exists else "This file does not exist yet and will be created."
        reply = QMessageBox.question(
            self, "Confirm Save",
            f"Save to:\n{path}\n\n{detail}",
            QMessageBox.Yes | QMessageBox.No,
            QMessageBox.No,
        )
        if reply != QMessageBox.Yes:
            return
        os.makedirs(config_dir, exist_ok=True)
        with open(path, "w", encoding="utf-8") as f:
            f.write(content)
        QMessageBox.information(self, "Saved", f"Saved to:\n{path}")

    def load_from_state(self):
        self._use_cycle.setChecked(self._state.use_map_cycle)
