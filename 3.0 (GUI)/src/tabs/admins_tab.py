from __future__ import annotations
import os
from typing import Callable
from PyQt5.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QListWidget,
    QLineEdit, QPushButton, QLabel, QMessageBox,
)
from ..state import LauncherState, FILE_ADMINS
from ..data import is_valid_steam_id


class AdminsTab(QWidget):
    def __init__(self, state: LauncherState, on_change: Callable):
        super().__init__()
        self._state = state
        self._build_ui()
        self.load_from_state()

    def _build_ui(self):
        layout = QVBoxLayout(self)

        layout.addWidget(QLabel("Admin SteamID64 List:"))

        self._list = QListWidget()
        layout.addWidget(self._list)

        add_row = QHBoxLayout()
        self._input = QLineEdit()
        self._input.setPlaceholderText("Enter SteamID64 (e.g. 76561198000000000)")
        self._input.returnPressed.connect(self._add)
        add_row.addWidget(self._input)

        add_btn = QPushButton("Add")
        add_btn.clicked.connect(self._add)
        add_row.addWidget(add_btn)

        remove_btn = QPushButton("Remove Selected")
        remove_btn.clicked.connect(self._remove)
        add_row.addWidget(remove_btn)
        layout.addLayout(add_row)

        save_row = QHBoxLayout()
        save_row.addStretch()

        load_btn = QPushButton("Load Admins.txt")
        load_btn.clicked.connect(self._load)
        save_row.addWidget(load_btn)

        save_btn = QPushButton("Save Admins.txt")
        save_btn.clicked.connect(self._save)
        save_row.addWidget(save_btn)
        layout.addLayout(save_row)

    def _add(self):
        text = self._input.text().strip()
        if not text:
            return
        if not is_valid_steam_id(text):
            QMessageBox.warning(
                self, "Invalid SteamID64",
                f"'{text}' is not a valid SteamID64.\n"
                "Expected 17 digits starting with 7656119.",
            )
            return
        self._list.addItem(text)
        self._input.clear()

    def _remove(self):
        for item in self._list.selectedItems():
            self._list.takeItem(self._list.row(item))

    def _load(self):
        if not self._state.exe_path:
            QMessageBox.warning(self, "No Exe Path",
                                "Set the server exe path in the Server tab first.")
            return
        path = self._state.config_file(FILE_ADMINS)
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
        path = self._state.config_file(FILE_ADMINS)
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
        pass
