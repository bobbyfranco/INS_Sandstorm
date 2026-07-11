from __future__ import annotations
from typing import Callable
from PyQt5.QtWidgets import QWidget, QFormLayout, QLineEdit, QCheckBox, QVBoxLayout
from ..state import LauncherState


class PasswordTab(QWidget):
    def __init__(self, state: LauncherState, on_change: Callable):
        super().__init__()
        self._state = state
        self._on_change = on_change
        self._build_ui()
        self.load_from_state()

    def _build_ui(self):
        form = QFormLayout()

        self._enabled = QCheckBox("Enable server password")
        self._enabled.stateChanged.connect(self._sync)
        form.addRow("", self._enabled)

        self._password = QLineEdit()
        self._password.setEchoMode(QLineEdit.Password)
        self._password.setPlaceholderText("Enter server password")
        self._password.setEnabled(False)
        self._password.textChanged.connect(self._sync)
        form.addRow("Password:", self._password)

        outer = QVBoxLayout(self)
        outer.addLayout(form)
        outer.addStretch()

    def _sync(self):
        self._state.use_pass = self._enabled.isChecked()
        self._password.setEnabled(self._state.use_pass)
        self._state.sv_pass = self._password.text()
        self._on_change()

    def load_from_state(self):
        self._enabled.setChecked(self._state.use_pass)
        self._password.setText(self._state.sv_pass)
        self._password.setEnabled(self._state.use_pass)
