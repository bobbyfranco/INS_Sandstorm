from __future__ import annotations
from typing import Callable
from PyQt5.QtWidgets import QWidget, QFormLayout, QLineEdit, QLabel, QVBoxLayout
from ..state import LauncherState


class AuthTab(QWidget):
    def __init__(self, state: LauncherState, on_change: Callable):
        super().__init__()
        self._state = state
        self._on_change = on_change
        self._build_ui()
        self.load_from_state()

    def _build_ui(self):
        form = QFormLayout()

        self._gslt_token = QLineEdit()
        self._gslt_token.setMaxLength(32)
        self._gslt_token.setPlaceholderText("32-character Steam/GSLT token")
        self._gslt_token.textChanged.connect(self._sync)
        form.addRow("GSLT Token:", self._gslt_token)

        self._nwi_token = QLineEdit()
        self._nwi_token.setMaxLength(32)
        self._nwi_token.setPlaceholderText("32-character NWI Game Stats token")
        self._nwi_token.textChanged.connect(self._sync)
        form.addRow("NWI Token:", self._nwi_token)

        self._status = QLabel("No valid tokens set")
        form.addRow("Status:", self._status)

        outer = QVBoxLayout(self)
        outer.addLayout(form)
        outer.addStretch()

    def _sync(self):
        self._state.gslt_token = self._gslt_token.text()
        self._state.nwi_token = self._nwi_token.text()
        self._update_status()
        self._on_change()

    def _update_status(self):
        v1 = len(self._state.gslt_token) == 32
        v2 = len(self._state.nwi_token) == 32
        if v1 and v2:
            self._status.setText("Steam & NWI tokens valid")
        elif v1:
            self._status.setText("Steam token valid")
        elif v2:
            self._status.setText("NWI token valid")
        else:
            self._status.setText("No valid tokens set")

    def load_from_state(self):
        self._gslt_token.setText(self._state.gslt_token)
        self._nwi_token.setText(self._state.nwi_token)
        self._update_status()
