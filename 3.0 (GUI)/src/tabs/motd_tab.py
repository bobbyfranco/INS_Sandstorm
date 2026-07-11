from __future__ import annotations
import os
from typing import Callable
from PyQt5.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QPlainTextEdit,
    QPushButton, QCheckBox, QLabel, QMessageBox,
)
from ..state import LauncherState, FILE_MOTD


class MotdTab(QWidget):
    def __init__(self, state: LauncherState, on_change: Callable):
        super().__init__()
        self._state = state
        self._on_change = on_change
        self._build_ui()
        self.load_from_state()

    def _build_ui(self):
        layout = QVBoxLayout(self)

        layout.addWidget(QLabel("Message of the Day (shown to players on join):"))

        self._editor = QPlainTextEdit()
        self._editor.setPlaceholderText("Enter your server MOTD here...")
        layout.addWidget(self._editor)

        row = QHBoxLayout()
        self._use_motd = QCheckBox("Include -motd flag in launch command")
        self._use_motd.stateChanged.connect(self._sync_toggle)
        row.addWidget(self._use_motd)
        row.addStretch()

        load_btn = QPushButton("Load Motd.txt")
        load_btn.clicked.connect(self._load)
        row.addWidget(load_btn)

        save_btn = QPushButton("Save Motd.txt")
        save_btn.clicked.connect(self._save)
        row.addWidget(save_btn)
        layout.addLayout(row)

    def _sync_toggle(self):
        self._state.use_motd = self._use_motd.isChecked()
        self._on_change()

    def _load(self):
        if not self._state.exe_path:
            QMessageBox.warning(self, "No Exe Path",
                                "Set the server exe path in the Server tab first.")
            return
        path = self._state.config_file(FILE_MOTD)
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
        path = self._state.config_file(FILE_MOTD)
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
            f.write(self._editor.toPlainText())
        QMessageBox.information(self, "Saved", f"Saved to:\n{path}")

    def load_from_state(self):
        self._use_motd.setChecked(self._state.use_motd)
