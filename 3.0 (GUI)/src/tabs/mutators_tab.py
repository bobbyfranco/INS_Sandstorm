from __future__ import annotations
from typing import Callable
from PyQt5.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QScrollArea, QGridLayout,
    QCheckBox, QGroupBox, QLabel, QLineEdit, QPushButton, QListWidget,
)
from ..state import LauncherState
from ..data import MUTATORS


class MutatorsTab(QWidget):
    def __init__(self, state: LauncherState, on_change: Callable):
        super().__init__()
        self._state = state
        self._on_change = on_change
        self._checkboxes: dict[str, QCheckBox] = {}
        self._build_ui()
        self.load_from_state()

    def _build_ui(self):
        outer = QVBoxLayout(self)

        scroll = QScrollArea()
        scroll.setWidgetResizable(True)
        container = QWidget()
        grid = QGridLayout(container)

        col = 0
        for category, names in MUTATORS.items():
            group = QGroupBox(category)
            glay = QVBoxLayout(group)
            for name in names:
                cb = QCheckBox(name)
                cb.stateChanged.connect(self._sync)
                glay.addWidget(cb)
                self._checkboxes[name] = cb
            grid.addWidget(group, 0, col)
            col += 1

        scroll.setWidget(container)
        outer.addWidget(scroll)

        # Custom mutator input
        custom_row = QHBoxLayout()
        self._custom_input = QLineEdit()
        self._custom_input.setPlaceholderText("Custom mutator name")
        add_btn = QPushButton("Add")
        add_btn.clicked.connect(self._add_custom)
        custom_row.addWidget(QLabel("Custom:"))
        custom_row.addWidget(self._custom_input)
        custom_row.addWidget(add_btn)
        outer.addLayout(custom_row)

        # Custom mutator list with remove button
        custom_list_row = QHBoxLayout()
        self._custom_list = QListWidget()
        self._custom_list.setMaximumHeight(72)
        remove_btn = QPushButton("Remove")
        remove_btn.setFixedWidth(72)
        remove_btn.clicked.connect(self._remove_custom)
        custom_list_row.addWidget(self._custom_list)
        custom_list_row.addWidget(remove_btn)
        outer.addLayout(custom_list_row)

        self._summary = QLabel("No mutators selected")
        self._summary.setWordWrap(True)
        outer.addWidget(self._summary)

        clear_btn = QPushButton("Clear All")
        clear_btn.clicked.connect(self._clear_all)
        outer.addWidget(clear_btn)

    def _sync(self):
        custom = [m for m in self._state.mutators if m not in self._checkboxes]
        selected = [name for name, cb in self._checkboxes.items() if cb.isChecked()]
        self._state.mutators = custom + selected
        self._update_summary()
        self._on_change()

    def _add_custom(self):
        name = self._custom_input.text().strip()
        if name and name not in self._state.mutators and name not in self._checkboxes:
            self._state.mutators.append(name)
            self._custom_list.addItem(name)
            self._custom_input.clear()
            self._update_summary()
            self._on_change()

    def _remove_custom(self):
        item = self._custom_list.currentItem()
        if item:
            name = item.text()
            self._custom_list.takeItem(self._custom_list.currentRow())
            if name in self._state.mutators:
                self._state.mutators.remove(name)
            self._update_summary()
            self._on_change()

    def _clear_all(self):
        for cb in self._checkboxes.values():
            cb.blockSignals(True)
            cb.setChecked(False)
            cb.blockSignals(False)
        self._custom_list.clear()
        self._state.mutators = []
        self._update_summary()
        self._on_change()

    def _update_summary(self):
        if self._state.mutators:
            self._summary.setText("Selected: " + ", ".join(self._state.mutators))
        else:
            self._summary.setText("No mutators selected")

    def load_from_state(self):
        for name, cb in self._checkboxes.items():
            cb.blockSignals(True)
            cb.setChecked(name in self._state.mutators)
            cb.blockSignals(False)
        self._custom_list.clear()
        for m in self._state.mutators:
            if m not in self._checkboxes:
                self._custom_list.addItem(m)
        self._update_summary()
