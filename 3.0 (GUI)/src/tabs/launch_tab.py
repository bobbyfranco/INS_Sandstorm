from __future__ import annotations
import subprocess
import os
from PyQt5.QtWidgets import (
    QWidget, QVBoxLayout, QTextEdit, QPushButton, QMessageBox, QLabel, QCheckBox,
)
from PyQt5.QtGui import QFont
from ..state import LauncherState


class LaunchTab(QWidget):
    def __init__(self, state: LauncherState):
        super().__init__()
        self._state = state
        self._proc = None
        self._build_ui()
        self.load_from_state()

    def _build_ui(self):
        layout = QVBoxLayout(self)
        layout.addWidget(QLabel("Launch Command Preview:"))

        self._preview = QTextEdit()
        self._preview.setReadOnly(True)
        self._preview.setMinimumHeight(100)
        self._preview.setFont(QFont("Consolas", 10))
        self._preview.setStyleSheet(
            "QTextEdit { background-color: #1e1e1e; color: #a8ff60; border: 1px solid #444; }"
        )
        layout.addWidget(self._preview)

        self._auto_launch = QCheckBox("Auto-launch on startup")
        self._auto_launch.stateChanged.connect(self._sync_auto_launch)
        layout.addWidget(self._auto_launch)

        self._launch_btn = QPushButton("Launch Server")
        self._launch_btn.setFixedHeight(48)
        self._launch_btn.clicked.connect(self._launch)
        layout.addWidget(self._launch_btn)

    def refresh_command(self):
        cmd = self._state.build_command()
        self._preview.setPlainText(cmd if cmd else "(incomplete - select gamemode and map)")

    def load_from_state(self):
        self._auto_launch.blockSignals(True)
        self._auto_launch.setChecked(self._state.auto_launch)
        self._auto_launch.blockSignals(False)
        self.refresh_command()

    def _sync_auto_launch(self):
        self._state.auto_launch = self._auto_launch.isChecked()

    def _launch(self):
        if self._proc is not None and self._proc.poll() is None:
            QMessageBox.warning(self, "Already Running", "The server is already running.")
            return
        if not self._state.exe_path or not os.path.exists(self._state.exe_path):
            QMessageBox.critical(self, "Error", "InsurgencyServer.exe not found.\nSet the path in the Server tab.")
            return
        if not self._state.gamemode_idx:
            QMessageBox.critical(self, "Error", "No gamemode selected.\nChoose one in the Game tab.")
            return
        if not self._state.map_value:
            QMessageBox.critical(self, "Error", "No map selected.\nChoose one in the Game tab.")
            return

        cmd = self._state.build_command()
        full_cmd = cmd.replace("InsurgencyServer.exe", f'"{self._state.exe_path}"', 1)
        self._proc = subprocess.Popen(full_cmd, shell=True, creationflags=subprocess.CREATE_NEW_CONSOLE)
        from PyQt5.QtWidgets import QApplication
        QApplication.instance().activeWindow().statusBar().showMessage(
            "Server launched. You can safely close this window, the server will keep running.", 0
        )
