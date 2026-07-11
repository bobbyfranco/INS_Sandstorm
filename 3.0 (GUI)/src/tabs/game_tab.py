from __future__ import annotations
from typing import Callable
from PyQt5.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QLabel, QComboBox,
    QListWidget, QPushButton, QGroupBox, QRadioButton, QLineEdit,
)
from PyQt5.QtCore import Qt
from ..state import LauncherState
from ..data import GAMEMODES, get_maps, is_team_based, random_map

class GameTab(QWidget):
    def __init__(self, state: LauncherState, on_change: Callable):
        super().__init__()
        self._state = state
        self._on_change = on_change
        self._build_ui()
        self.load_from_state()

    def _add_combo_header(self, text: str):
        self._gm_combo.addItem(text)
        item = self._gm_combo.model().item(self._gm_combo.count() - 1)
        item.setFlags(Qt.NoItemFlags)

    def _build_ui(self):
        layout = QVBoxLayout(self)

        # Gamemode
        gm_row = QHBoxLayout()
        gm_row.addWidget(QLabel("Gamemode:"))
        self._gm_combo = QComboBox()

        for label, category in (("── Co-op ──", "coop"), ("── Versus ──", "versus"), ("── Special ──", "special")):
            self._add_combo_header(label)
            for gm in GAMEMODES:
                if gm["category"] == category:
                    self._gm_combo.addItem(gm["name"], gm["idx"])

        self._gm_combo.addItem("Custom…", -1)
        self._gm_combo.currentIndexChanged.connect(self._on_gamemode_changed)
        gm_row.addWidget(self._gm_combo)
        self._custom_gm = QLineEdit()
        self._custom_gm.setPlaceholderText("Custom gamemode name")
        self._custom_gm.setVisible(False)
        self._custom_gm.textChanged.connect(self._sync)
        gm_row.addWidget(self._custom_gm)
        layout.addLayout(gm_row)

        # Team selector
        self._team_group = QGroupBox("Team")
        team_row = QHBoxLayout(self._team_group)
        self._team_sec = QRadioButton("Security")
        self._team_ins = QRadioButton("Insurgents")
        self._team_sec.setChecked(True)
        self._team_sec.toggled.connect(self._on_team_changed)
        team_row.addWidget(self._team_sec)
        team_row.addWidget(self._team_ins)
        layout.addWidget(self._team_group)

        # Map list
        map_label_row = QHBoxLayout()
        map_label_row.addWidget(QLabel("Map:"))
        self._random_btn = QPushButton("Random")
        self._random_btn.clicked.connect(self._pick_random)
        map_label_row.addStretch()
        map_label_row.addWidget(self._random_btn)
        layout.addLayout(map_label_row)

        self._map_list = QListWidget()
        self._map_list.currentRowChanged.connect(self._on_map_selected)
        layout.addWidget(self._map_list)

        # Custom map
        custom_row = QHBoxLayout()
        self._custom_map = QLineEdit()
        self._custom_map.setPlaceholderText("Custom: MapName?Scenario=Scenario_Map_Mode")
        self._custom_map.textChanged.connect(self._on_custom_map_changed)
        custom_row.addWidget(QLabel("Custom map:"))
        custom_row.addWidget(self._custom_map)
        layout.addLayout(custom_row)

        # Day/Night
        dn_group = QGroupBox("Lighting")
        dn_row = QHBoxLayout(dn_group)
        self._day_rb = QRadioButton("Day")
        self._night_rb = QRadioButton("Night")
        self._day_rb.setChecked(True)
        self._day_rb.toggled.connect(self._on_lighting_changed)
        dn_row.addWidget(self._day_rb)
        dn_row.addWidget(self._night_rb)
        layout.addWidget(dn_group)

    def _current_gamemode_idx(self):
        return self._gm_combo.currentData()

    def _current_team(self) -> int:
        return 1 if self._team_sec.isChecked() else 2

    def _on_gamemode_changed(self):
        idx = self._current_gamemode_idx()
        if idx is None:  # header item
            return
        self._custom_gm.setVisible(idx == -1)
        self._team_group.setVisible(is_team_based(idx))
        self._refresh_map_list()
        if idx != -1:
            self._state.gamemode_idx = idx
        self._state.map_value = ""
        # Auto-select first map when gamemode changes
        maps = get_maps(idx, self._current_team()) if idx != -1 else []
        if maps:
            self._map_list.blockSignals(True)
            self._map_list.setCurrentRow(0)
            self._map_list.blockSignals(False)
            self._state.map_value = maps[0][1]
        self._on_change()

    def _on_team_changed(self):
        # Remember current map name so we can re-select the same map after refresh
        current_row = self._map_list.currentRow()
        old_name = self._map_list.item(current_row).text() if current_row >= 0 and self._map_list.item(current_row) else ""
        self._state.team = self._current_team()
        self._refresh_map_list()
        maps = get_maps(self._current_gamemode_idx() or 0, self._current_team())
        matched = False
        if old_name:
            for row, (name, val) in enumerate(maps):
                if name == old_name:
                    self._map_list.blockSignals(True)
                    self._map_list.setCurrentRow(row)
                    self._map_list.blockSignals(False)
                    self._state.map_value = val
                    matched = True
                    break
        if not matched and maps:
            self._map_list.blockSignals(True)
            self._map_list.setCurrentRow(0)
            self._map_list.blockSignals(False)
            self._state.map_value = maps[0][1]
        self._on_change()

    def _refresh_map_list(self):
        self._map_list.blockSignals(True)
        self._map_list.clear()
        idx = self._current_gamemode_idx()
        if idx and idx != -1:
            for name, _ in get_maps(idx, self._current_team()):
                self._map_list.addItem(name)
        self._map_list.blockSignals(False)

    def _on_map_selected(self, row: int):
        if row < 0:
            return
        idx = self._current_gamemode_idx()
        maps = get_maps(idx, self._current_team())
        if row < len(maps):
            self._state.map_value = maps[row][1]
            self._custom_map.blockSignals(True)
            self._custom_map.clear()
            self._custom_map.blockSignals(False)
            self._on_change()

    def _on_custom_map_changed(self, text: str):
        if text:
            self._state.map_value = text
            self._map_list.clearSelection()
            self._on_change()

    def _on_lighting_changed(self):
        self._state.lighting = "Day" if self._day_rb.isChecked() else "Night"
        self._on_change()

    def _pick_random(self):
        idx = self._current_gamemode_idx()
        if not idx or idx == -1:
            return
        val = random_map(idx, self._current_team())
        if val:
            self._state.map_value = val
            maps = get_maps(idx, self._current_team())
            for row, (_, map_val) in enumerate(maps):
                if map_val == val:
                    self._map_list.blockSignals(True)
                    self._map_list.setCurrentRow(row)
                    self._map_list.blockSignals(False)
                    break
            self._on_change()

    def _sync(self):
        self._on_change()

    def load_from_state(self):
        # Gamemode — block signals to prevent _on_gamemode_changed clearing map_value
        self._gm_combo.blockSignals(True)
        for i in range(self._gm_combo.count()):
            if self._gm_combo.itemData(i) == self._state.gamemode_idx:
                self._gm_combo.setCurrentIndex(i)
                break
        self._gm_combo.blockSignals(False)
        # Team
        self._team_group.setVisible(is_team_based(self._state.gamemode_idx))
        if self._state.team == 2:
            self._team_ins.setChecked(True)
        else:
            self._team_sec.setChecked(True)
        # Lighting
        if self._state.lighting == "Night":
            self._night_rb.setChecked(True)
        else:
            self._day_rb.setChecked(True)
        self._refresh_map_list()
        # Restore or auto-select map
        idx = self._current_gamemode_idx()
        if idx and idx != -1:
            maps = get_maps(idx, self._current_team())
            if self._state.map_value:
                for row, (_, val) in enumerate(maps):
                    if val == self._state.map_value:
                        self._map_list.blockSignals(True)
                        self._map_list.setCurrentRow(row)
                        self._map_list.blockSignals(False)
                        break
            elif maps:
                self._map_list.blockSignals(True)
                self._map_list.setCurrentRow(0)
                self._map_list.blockSignals(False)
                self._state.map_value = maps[0][1]
