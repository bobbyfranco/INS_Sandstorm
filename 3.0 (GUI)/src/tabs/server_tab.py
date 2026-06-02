from __future__ import annotations
from typing import Callable
import os
from PyQt5.QtWidgets import (
    QWidget, QFormLayout, QLineEdit, QSpinBox, QCheckBox,
    QPushButton, QHBoxLayout, QFileDialog, QVBoxLayout, QMessageBox,
)
from ..state import LauncherState, get_game_ini_path, get_engine_ini_path


class ServerTab(QWidget):
    def __init__(self, state: LauncherState, on_change: Callable,
                 on_save: Callable, on_load: Callable, on_reset: Callable):
        super().__init__()
        self._state = state
        self._on_change = on_change
        self._on_save = on_save
        self._on_load = on_load
        self._on_reset = on_reset
        self._build_ui()
        self.load_from_state()

    def _build_ui(self):
        form = QFormLayout()

        self._name = QLineEdit()
        self._name.textChanged.connect(self._sync)
        form.addRow("Server Name:", self._name)

        self._ip = QLineEdit()
        self._ip.textChanged.connect(self._sync)
        form.addRow("IPv4 Address:", self._ip)

        self._parse_ip = QCheckBox("Parse IP (adds -MultiHome=<ip>)")
        self._parse_ip.stateChanged.connect(self._sync)
        form.addRow("", self._parse_ip)

        self._broadcast_ip = QCheckBox("Broadcast IP (adds -broadcastip=<ip>)")
        self._broadcast_ip.stateChanged.connect(self._sync)
        form.addRow("", self._broadcast_ip)

        self._max = QSpinBox()
        self._max.setRange(1, 32)
        self._max.valueChanged.connect(self._sync)
        form.addRow("Max Players:", self._max)

        self._cheats = QCheckBox("Enable Cheats")
        self._cheats.stateChanged.connect(self._sync)
        form.addRow("", self._cheats)

        self._port = QSpinBox()
        self._port.setRange(1, 65535)
        self._port.valueChanged.connect(self._sync)
        form.addRow("Game Port:", self._port)

        self._query_port = QSpinBox()
        self._query_port.setRange(1, 65535)
        self._query_port.valueChanged.connect(self._sync)
        form.addRow("Query Port:", self._query_port)

        exe_row = QHBoxLayout()
        exe_row.setContentsMargins(0, 0, 0, 0)
        self._exe_path = QLineEdit()
        self._exe_path.setReadOnly(True)
        self._exe_browse = QPushButton("Browse…")
        self._exe_browse.clicked.connect(self._browse_exe)
        exe_row.addWidget(self._exe_path)
        exe_row.addWidget(self._exe_browse)
        exe_container = QWidget()
        exe_container.setLayout(exe_row)
        form.addRow("Server Exe:", exe_container)

        ini_row = QHBoxLayout()
        ini_row.setContentsMargins(0, 0, 0, 0)
        game_ini_btn = QPushButton("Open Game.ini")
        game_ini_btn.clicked.connect(self._open_game_ini)
        engine_ini_btn = QPushButton("Open Engine.ini")
        engine_ini_btn.clicked.connect(self._open_engine_ini)
        ini_row.addWidget(game_ini_btn)
        ini_row.addWidget(engine_ini_btn)
        ini_container = QWidget()
        ini_container.setLayout(ini_row)
        form.addRow("Game Config:", ini_container)

        btn_row = QHBoxLayout()
        save_btn = QPushButton("Save Config")
        save_btn.clicked.connect(self._on_save)
        load_btn = QPushButton("Load Config")
        load_btn.clicked.connect(self._on_load)
        reset_btn = QPushButton("Reset")
        reset_btn.clicked.connect(self._on_reset)
        btn_row.addWidget(save_btn)
        btn_row.addWidget(load_btn)
        btn_row.addWidget(reset_btn)
        btn_container = QWidget()
        btn_container.setLayout(btn_row)
        form.addRow("", btn_container)

        outer = QVBoxLayout(self)
        outer.addLayout(form)
        outer.addStretch()

    def _sync(self):
        self._state.sv_name = self._name.text()
        self._state.sv_ip = self._ip.text()
        self._state.sv_max = self._max.value()
        self._state.cheats = self._cheats.isChecked()
        self._state.sv_port = self._port.value()
        self._state.sv_query_port = self._query_port.value()
        self._state.use_parse_ip = self._parse_ip.isChecked()
        self._state.use_broadcast_ip = self._broadcast_ip.isChecked()
        self._update_ip_toggles()
        self._on_change()

    def _update_ip_toggles(self):
        has_ip = bool(self._ip.text().strip())
        self._parse_ip.setEnabled(has_ip)
        self._broadcast_ip.setEnabled(has_ip)

    def _browse_exe(self):
        path, _ = QFileDialog.getOpenFileName(
            self, "Select InsurgencyServer.exe", "", "Executable (*.exe)"
        )
        if path:
            self._state.exe_path = path
            self._exe_path.setText(path)
            self._on_change()

    def _open_game_ini(self):
        if not self._state.exe_path:
            QMessageBox.warning(self, "No Exe Path",
                                "Set the server exe path in the Server tab first.")
            return
        path = get_game_ini_path(self._state.exe_path)
        if not os.path.exists(path):
            QMessageBox.information(self, "Not Found",
                                    f"Game.ini not found at:\n{path}\n\n"
                                    "Start the server once to generate it.")
            return
        os.startfile(path)

    def _open_engine_ini(self):
        if not self._state.exe_path:
            QMessageBox.warning(self, "No Exe Path",
                                "Set the server exe path in the Server tab first.")
            return
        path = get_engine_ini_path(self._state.exe_path)
        if not os.path.exists(path):
            QMessageBox.information(self, "Not Found",
                                    f"Engine.ini not found at:\n{path}\n\n"
                                    "Start the server once to generate it.")
            return
        os.startfile(path)

    def load_from_state(self):
        for w in (self._name, self._ip, self._max, self._cheats,
                  self._port, self._query_port, self._parse_ip, self._broadcast_ip):
            w.blockSignals(True)
        self._name.setText(self._state.sv_name)
        self._ip.setText(self._state.sv_ip)
        self._max.setValue(self._state.sv_max)
        self._cheats.setChecked(self._state.cheats)
        self._port.setValue(self._state.sv_port)
        self._query_port.setValue(self._state.sv_query_port)
        self._exe_path.setText(self._state.exe_path)
        self._parse_ip.setChecked(self._state.use_parse_ip)
        self._broadcast_ip.setChecked(self._state.use_broadcast_ip)
        for w in (self._name, self._ip, self._max, self._cheats,
                  self._port, self._query_port, self._parse_ip, self._broadcast_ip):
            w.blockSignals(False)
        self._update_ip_toggles()
