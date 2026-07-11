from __future__ import annotations
import os
import webbrowser
from typing import Callable
from PyQt5.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QListWidget,
    QLineEdit, QPushButton, QCheckBox, QLabel, QMessageBox,
)
from ..state import LauncherState, FILE_MODS
from ..data import is_valid_mod_id

_MODIO_URL = "https://mod.io/g/insurgencysandstorm"


class ModsTab(QWidget):
    def __init__(self, state: LauncherState, on_change: Callable):
        super().__init__()
        self._state = state
        self._on_change = on_change
        self._build_ui()
        self.load_from_state()

    def _build_ui(self):
        layout = QVBoxLayout(self)

        layout.addWidget(QLabel("Mod IDs (one per entry):"))

        self._list = QListWidget()
        layout.addWidget(self._list)

        add_row = QHBoxLayout()
        self._input = QLineEdit()
        self._input.setPlaceholderText("Enter Mod ID (numeric)")
        self._input.returnPressed.connect(self._add)
        add_row.addWidget(self._input)

        add_btn = QPushButton("Add")
        add_btn.clicked.connect(self._add)
        add_row.addWidget(add_btn)

        remove_btn = QPushButton("Remove Selected")
        remove_btn.clicked.connect(self._remove)
        add_row.addWidget(remove_btn)
        layout.addLayout(add_row)

        bottom_row = QHBoxLayout()
        self._use_mods = QCheckBox("Include -Mods flag in launch command")
        self._use_mods.stateChanged.connect(self._sync_toggle)
        bottom_row.addWidget(self._use_mods)
        bottom_row.addStretch()

        browse_btn = QPushButton("Browse Mods (mod.io)")
        browse_btn.clicked.connect(lambda: webbrowser.open(_MODIO_URL))
        bottom_row.addWidget(browse_btn)

        load_btn = QPushButton("Load Mods.txt")
        load_btn.clicked.connect(self._load)
        bottom_row.addWidget(load_btn)

        save_btn = QPushButton("Save Mods.txt")
        save_btn.clicked.connect(self._save)
        bottom_row.addWidget(save_btn)
        layout.addLayout(bottom_row)

    def _add(self):
        text = self._input.text().strip()
        if not text:
            return
        if not is_valid_mod_id(text):
            QMessageBox.warning(
                self, "Invalid Mod ID",
                f"'{text}' is not a valid Mod ID.\nExpected a numeric value.",
            )
            return
        self._list.addItem(text)
        self._input.clear()

    def _remove(self):
        for item in self._list.selectedItems():
            self._list.takeItem(self._list.row(item))

    def _sync_toggle(self):
        self._state.use_mods = self._use_mods.isChecked()
        self._on_change()

    def _load(self):
        if not self._state.exe_path:
            QMessageBox.warning(self, "No Exe Path",
                                "Set the server exe path in the Server tab first.")
            return
        path = self._state.config_file(FILE_MODS)
        if not os.path.exists(path):
            QMessageBox.information(self, "Not Found", f"No file found at:\n{path}")
            return
        with open(path, "r", encoding="utf-8") as f:
            entries = [line.strip() for line in f if line.strip()]
        self._list.clear()
        for entry in entries:
            self._list.addItem(entry)

    def _save(self):
        if not self._state.exe_path:
            QMessageBox.warning(self, "No Exe Path",
                                "Set the server exe path in the Server tab first.")
            return
        path = self._state.config_file(FILE_MODS)
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
        entries = [self._list.item(i).text() for i in range(self._list.count())]
        with open(path, "w", encoding="utf-8") as f:
            f.write("\n".join(entries))
        QMessageBox.information(self, "Saved", f"Saved to:\n{path}")

    def load_from_state(self):
        self._use_mods.setChecked(self._state.use_mods)
