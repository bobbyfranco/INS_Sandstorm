from __future__ import annotations
from dataclasses import dataclass, field, asdict
import json
import os
import socket

FILE_MOTD = "Motd.txt"
FILE_ADMINS = "Admins.txt"
FILE_MAP_CYCLE = "MapCycle.txt"
FILE_MODS = "Mods.txt"
FILE_GAME_INI = "Game.ini"
FILE_ENGINE_INI = "Engine.ini"


def _get_local_ip() -> str:
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as s:
            s.connect(("8.8.8.8", 80))
            return s.getsockname()[0]
    except Exception:
        return "127.0.0.1"


def peek_auto_launch(path: str) -> bool:
    try:
        with open(path, "r", encoding="utf-8") as f:
            data = json.load(f)
        return bool(data.get("auto_launch", False))
    except Exception:
        return False


def get_server_config_dir(exe_path: str) -> str:
    server_root = os.path.dirname(exe_path)
    return os.path.join(server_root, "Insurgency", "Config", "Server")


def get_game_ini_path(exe_path: str) -> str:
    server_root = os.path.dirname(exe_path)
    return os.path.normpath(os.path.join(
        server_root, "Insurgency", "Saved", "Config", "WindowsServer", FILE_GAME_INI
    ))


def get_engine_ini_path(exe_path: str) -> str:
    server_root = os.path.dirname(exe_path)
    return os.path.normpath(os.path.join(
        server_root, "Insurgency", "Saved", "Config", "WindowsServer", FILE_ENGINE_INI
    ))


@dataclass
class LauncherState:
    exe_path: str = ""
    sv_name: str = "INS Server"
    sv_ip: str = ""
    sv_max: int = 8
    cheats: bool = False
    sv_port: int = 27102
    sv_query_port: int = 27131
    gamemode_idx: int = 1
    team: int = 1
    map_value: str = ""
    lighting: str = "Day"
    mutators: list = field(default_factory=list)
    gslt_token: str = ""
    nwi_token: str = ""
    sv_pass: str = ""
    use_pass: bool = False
    use_map_cycle: bool = False
    use_motd: bool = False
    use_mods: bool = False
    use_parse_ip: bool = False
    use_broadcast_ip: bool = False
    auto_launch: bool = False

    def __post_init__(self):
        if not self.sv_ip:
            self.sv_ip = _get_local_ip()

    def config_file(self, filename: str) -> str:
        return os.path.normpath(os.path.join(get_server_config_dir(self.exe_path), filename))

    def build_command(self) -> str:
        from .data import get_gamemode
        if not self.map_value or not self.gamemode_idx:
            return ""
        gm = get_gamemode(self.gamemode_idx)
        if not gm:
            return ""

        mode_str = gm["mode"]
        cmd = (
            f"InsurgencyServer.exe {self.map_value}"
            f"?MaxPlayers={self.sv_max}"
            f"?Lighting={self.lighting}"
            f"?Game={mode_str}"
            f" -Port={self.sv_port}"
            f" -QueryPort={self.sv_query_port}"
            f" -log"
            f' -hostname="{self.sv_name}"'
        )

        if self.cheats:
            cmd += " -EnableCheats"

        all_mutators = list(self.mutators)
        if self.gamemode_idx == 2 and "Hardcore" not in all_mutators:
            all_mutators = ["Hardcore"] + all_mutators
        if all_mutators:
            cmd += f" -mutators={','.join(all_mutators)}"

        if self.use_pass and self.sv_pass:
            cmd += f" -password={self.sv_pass}"
        if self.use_map_cycle:
            cmd += " -MapCycle=MapCycle.txt"
        if self.use_motd:
            cmd += " -motd"
        if self.use_parse_ip and self.sv_ip:
            cmd += f" -MultiHome={self.sv_ip}"
        if self.use_broadcast_ip and self.sv_ip:
            cmd += f" -broadcastip={self.sv_ip}"

        if len(self.gslt_token) == 32:
            cmd += f" -GSLTToken={self.gslt_token}"
        if len(self.nwi_token) == 32:
            cmd += f" -GameStats -GameStatsToken={self.nwi_token}"

        if self.use_mods and self.map_value:
            cmd += f" -Mods -ModDownloadTravelTo={self.map_value}"

        return cmd

    def save(self, path: str) -> None:
        with open(path, "w", encoding="utf-8") as f:
            json.dump(asdict(self), f, indent=2)

    @classmethod
    def load(cls, path: str) -> LauncherState:
        with open(path, "r", encoding="utf-8") as f:
            data = json.load(f)
        known = {k: v for k, v in data.items() if k in cls.__dataclass_fields__}
        return cls(**known)
