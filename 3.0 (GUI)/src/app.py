from __future__ import annotations
import os
import sys
from PyQt5.QtCore import QTimer, Qt
from PyQt5.QtGui import QColor, QIcon
from PyQt5.QtWidgets import (
    QDialog, QMainWindow, QMessageBox, QPushButton, QTabWidget, QVBoxLayout,
)

from .state import LauncherState, peek_auto_launch
from .tabs.admins_tab import AdminsTab
from .tabs.auth_tab import AuthTab
from .tabs.game_tab import GameTab
from .tabs.help_tab import HelpTab
from .tabs.launch_tab import LaunchTab
from .tabs.map_cycle_tab import MapCycleTab
from .tabs.mods_tab import ModsTab
from .tabs.motd_tab import MotdTab
from .tabs.mutators_tab import MutatorsTab
from .tabs.password_tab import PasswordTab
from .tabs.server_tab import ServerTab

_GUI_DIR = os.path.dirname(os.path.dirname(__file__))
_frozen = getattr(sys, 'frozen', False)
_APP_DIR = os.path.dirname(sys.executable) if _frozen else _GUI_DIR
_ASSETS_DIR = sys._MEIPASS if _frozen else _GUI_DIR

CONFIG_PATH = os.path.join(_APP_DIR, "launcher_config.json")
_ICON_PATH = os.path.join(_ASSETS_DIR, "assets", "icon.ico")


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Insurgency Sandstorm Advanced Server Launcher")
        self.setMinimumSize(900, 600)
        if os.path.exists(_ICON_PATH):
            self.setWindowIcon(QIcon(_ICON_PATH))

        self.state = LauncherState()
        self._pending_auto_launch = False
        self._maybe_auto_load_config()
        self._auto_detect_exe()
        self._build_ui()
        if self._pending_auto_launch:
            self._refresh_all_tabs()
        QTimer.singleShot(0, self._check_auto_launch)

    def _auto_detect_exe(self):
        if not self.state.exe_path:
            candidate = os.path.join(_GUI_DIR, "InsurgencyServer.exe")
            if os.path.exists(candidate):
                self.state.exe_path = candidate

    def _maybe_auto_load_config(self):
        if peek_auto_launch(CONFIG_PATH):
            loaded = LauncherState.load(CONFIG_PATH)
            self.state.__dict__.update(loaded.__dict__)
            self._pending_auto_launch = True

    def _check_auto_launch(self):
        if not self._pending_auto_launch:
            return
        reply = QMessageBox.question(
            self, "Auto-Launch",
            "Auto-launch is enabled. Launch server now?",
            QMessageBox.Yes | QMessageBox.No,
            QMessageBox.Yes,
        )
        if reply == QMessageBox.Yes:
            self._launch_tab._launch()

    def _show_help(self):
        if not hasattr(self, '_help_win') or not self._help_win.isVisible():
            self._help_win = QDialog(self)
            self._help_win.setWindowFlags(
                self._help_win.windowFlags() & ~Qt.WindowContextHelpButtonHint
            )
            self._help_win.setWindowTitle("Help")
            self._help_win.resize(700, 600)
            layout = QVBoxLayout(self._help_win)
            layout.setContentsMargins(0, 0, 0, 0)
            layout.addWidget(HelpTab())
            self._help_win.show()
        else:
            self._help_win.raise_()
            self._help_win.activateWindow()

    def _build_ui(self):
        self._tabs = QTabWidget()

        self._server_tab = ServerTab(
            self.state, self.on_state_changed, self.save_config, self.load_config, self.reset_config
        )
        self._game_tab = GameTab(self.state, self.on_state_changed)
        self._mutators_tab = MutatorsTab(self.state, self.on_state_changed)
        self._auth_tab = AuthTab(self.state, self.on_state_changed)
        self._password_tab = PasswordTab(self.state, self.on_state_changed)
        self._launch_tab = LaunchTab(self.state)
        self._motd_tab = MotdTab(self.state, self.on_state_changed)
        self._map_cycle_tab = MapCycleTab(self.state, self.on_state_changed)
        self._admins_tab = AdminsTab(self.state, self.on_state_changed)
        self._mods_tab = ModsTab(self.state, self.on_state_changed)

        self._tabs.addTab(self._server_tab, "Server")
        self._tabs.addTab(self._game_tab, "Game")
        self._tabs.addTab(self._mutators_tab, "Mutators")
        self._tabs.addTab(self._auth_tab, "Auth")
        self._tabs.addTab(self._password_tab, "Password")
        self._tabs.addTab(self._motd_tab, "MOTD")
        self._tabs.addTab(self._map_cycle_tab, "Map Cycle")
        self._tabs.addTab(self._admins_tab, "Admins")
        self._tabs.addTab(self._mods_tab, "Mods")
        self._tabs.addTab(self._launch_tab, "Launch")

        self._tabs.tabBar().setTabTextColor(9, QColor("#2d7a2d"))

        self.setCentralWidget(self._tabs)

        help_btn = QPushButton("Help")
        help_btn.setFixedHeight(26)
        help_btn.setToolTip("Open Help")
        help_btn.setStyleSheet(
            "QPushButton { background-color: #2a6099; color: white; font-weight: bold; font-size: 13px; padding: 0 10px; border: none; border-radius: 3px; }"
            "QPushButton:hover { background-color: #1e4d7a; }"
        )
        help_btn.clicked.connect(self._show_help)
        self.statusBar().addPermanentWidget(help_btn)

    def on_state_changed(self):
        if hasattr(self, '_launch_tab'):
            self._launch_tab.refresh_command()

    def save_config(self):
        if os.path.exists(CONFIG_PATH):
            reply = QMessageBox.question(
                self, "Overwrite Config",
                f"Overwrite existing config?\n{os.path.normpath(CONFIG_PATH)}",
                QMessageBox.Yes | QMessageBox.No,
                QMessageBox.No,
            )
            if reply != QMessageBox.Yes:
                return
        self.state.save(CONFIG_PATH)
        self.statusBar().showMessage(f"Config saved - {os.path.basename(CONFIG_PATH)}", 3000)

    def reset_config(self):
        reply = QMessageBox.question(
            self, "Reset to Defaults",
            "Reset all settings to defaults?\nThis does not delete your saved config file.",
            QMessageBox.Yes | QMessageBox.No,
            QMessageBox.No,
        )
        if reply != QMessageBox.Yes:
            return
        self.state.__dict__.update(LauncherState().__dict__)
        self._refresh_all_tabs()
        self.on_state_changed()
        self.statusBar().showMessage("Settings reset to defaults.", 3000)

    def load_config(self):
        if os.path.exists(CONFIG_PATH):
            loaded = LauncherState.load(CONFIG_PATH)
            self.state.__dict__.update(loaded.__dict__)
            self._refresh_all_tabs()
            self.on_state_changed()

    def _refresh_all_tabs(self):
        self._server_tab.load_from_state()
        self._game_tab.load_from_state()
        self._mutators_tab.load_from_state()
        self._auth_tab.load_from_state()
        self._password_tab.load_from_state()
        self._motd_tab.load_from_state()
        self._map_cycle_tab.load_from_state()
        self._admins_tab.load_from_state()
        self._mods_tab.load_from_state()
        self._launch_tab.load_from_state()
