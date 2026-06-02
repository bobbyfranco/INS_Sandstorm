import sys, os, json, tempfile
sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))

from src.state import LauncherState, get_server_config_dir, peek_auto_launch


def test_default_state():
    s = LauncherState()
    assert s.sv_name == "INS Server"
    assert s.sv_max == 8
    assert s.sv_port == 27102
    assert s.sv_query_port == 27131
    assert s.lighting == "Day"
    assert s.mutators == []


def test_build_command_empty_returns_empty():
    s = LauncherState()
    assert s.build_command() == ""


def test_build_command_missing_map_returns_empty():
    s = LauncherState(exe_path="C:/server/InsurgencyServer.exe", gamemode_idx=1)
    assert s.build_command() == ""


def test_build_command_basic():
    s = LauncherState(
        exe_path="C:/server/InsurgencyServer.exe",
        gamemode_idx=1,
        map_value="Town?Scenario=Scenario_Hideout_Checkpoint_Security",
        sv_name="Test Server",
        sv_max=16,
        sv_port=27102,
        sv_query_port=27131,
        lighting="Day",
    )
    cmd = s.build_command()
    assert cmd.startswith("InsurgencyServer.exe")
    assert "Town?Scenario=Scenario_Hideout_Checkpoint_Security" in cmd
    assert "MaxPlayers=16" in cmd
    assert "Lighting=Day" in cmd
    assert "Game=Checkpoint" in cmd
    assert "-Port=27102" in cmd
    assert "-QueryPort=27131" in cmd
    assert '-hostname="Test Server"' in cmd


def test_build_command_hardcore_adds_mutator():
    s = LauncherState(
        exe_path="C:/server/InsurgencyServer.exe",
        gamemode_idx=2,
        map_value="Town?Scenario=Scenario_Hideout_Checkpoint_Security",
    )
    cmd = s.build_command()
    assert "-mutators=Hardcore" in cmd


def test_build_command_password():
    s = LauncherState(
        exe_path="C:/server/InsurgencyServer.exe",
        gamemode_idx=3,
        map_value="Town?Scenario=Scenario_Hideout_Outpost",
        use_pass=True,
        sv_pass="secret",
    )
    assert "-password=secret" in s.build_command()


def test_build_command_no_password_when_disabled():
    s = LauncherState(
        exe_path="C:/server/InsurgencyServer.exe",
        gamemode_idx=3,
        map_value="Town?Scenario=Scenario_Hideout_Outpost",
        use_pass=False,
        sv_pass="secret",
    )
    assert "-password" not in s.build_command()


def test_build_command_valid_gslt_token():
    s = LauncherState(
        exe_path="C:/server/InsurgencyServer.exe",
        gamemode_idx=3,
        map_value="Town?Scenario=Scenario_Hideout_Outpost",
        gslt_token="a" * 32,
    )
    assert "-GSLTToken=" + "a" * 32 in s.build_command()


def test_build_command_invalid_gslt_token_omitted():
    s = LauncherState(
        exe_path="C:/server/InsurgencyServer.exe",
        gamemode_idx=3,
        map_value="Town?Scenario=Scenario_Hideout_Outpost",
        gslt_token="short",
    )
    assert "-GSLTToken" not in s.build_command()


def test_save_and_load_roundtrip():
    s = LauncherState(sv_name="My Server", sv_max=16, sv_port=27200, mutators=["Hardcore"])
    with tempfile.NamedTemporaryFile(suffix=".json", delete=False, mode="w") as f:
        path = f.name
    try:
        s.save(path)
        loaded = LauncherState.load(path)
        assert loaded.sv_name == "My Server"
        assert loaded.sv_max == 16
        assert loaded.sv_port == 27200
        assert loaded.mutators == ["Hardcore"]
    finally:
        os.unlink(path)


def test_load_ignores_unknown_keys():
    with tempfile.NamedTemporaryFile(suffix=".json", delete=False, mode="w") as f:
        json.dump({"sv_name": "Test", "unknown_field": "value"}, f)
        path = f.name
    try:
        s = LauncherState.load(path)
        assert s.sv_name == "Test"
    finally:
        os.unlink(path)


def test_get_server_config_dir_from_exe():
    result = get_server_config_dir("C:/server/InsurgencyServer.exe")
    assert result == os.path.join("C:/server", "Insurgency", "Config", "Server")


def test_get_server_config_dir_nested_path():
    result = get_server_config_dir("D:/games/INS/InsurgencyServer.exe")
    assert result == os.path.join("D:/games/INS", "Insurgency", "Config", "Server")


def test_build_command_parse_ip_included():
    s = LauncherState(
        gamemode_idx=1,
        map_value="Town?Scenario=Scenario_Hideout_Checkpoint_Security",
        use_parse_ip=True,
        sv_ip="192.168.1.10",
    )
    assert "-MultiHome=192.168.1.10" in s.build_command()


def test_build_command_parse_ip_excluded_when_disabled():
    s = LauncherState(
        gamemode_idx=1,
        map_value="Town?Scenario=Scenario_Hideout_Checkpoint_Security",
        use_parse_ip=False,
        sv_ip="192.168.1.10",
    )
    assert "-MultiHome" not in s.build_command()


def test_build_command_broadcast_ip_included():
    s = LauncherState(
        gamemode_idx=1,
        map_value="Town?Scenario=Scenario_Hideout_Checkpoint_Security",
        use_broadcast_ip=True,
        sv_ip="192.168.1.10",
    )
    assert "-broadcastip=192.168.1.10" in s.build_command()


def test_build_command_broadcast_ip_excluded_when_disabled():
    s = LauncherState(
        gamemode_idx=1,
        map_value="Town?Scenario=Scenario_Hideout_Checkpoint_Security",
        use_broadcast_ip=False,
        sv_ip="192.168.1.10",
    )
    assert "-broadcastip" not in s.build_command()


def test_build_command_ip_flags_excluded_when_ip_empty():
    s = LauncherState(
        gamemode_idx=1,
        map_value="Town?Scenario=Scenario_Hideout_Checkpoint_Security",
        use_parse_ip=True,
        use_broadcast_ip=True,
    )
    s.sv_ip = ""  # clear after __post_init__ auto-detection
    cmd = s.build_command()
    assert "-MultiHome" not in cmd
    assert "-broadcastip" not in cmd


def test_peek_auto_launch_true():
    with tempfile.NamedTemporaryFile(suffix=".json", delete=False, mode="w") as f:
        json.dump({"auto_launch": True}, f)
        path = f.name
    try:
        assert peek_auto_launch(path) is True
    finally:
        os.unlink(path)


def test_peek_auto_launch_false():
    with tempfile.NamedTemporaryFile(suffix=".json", delete=False, mode="w") as f:
        json.dump({"auto_launch": False}, f)
        path = f.name
    try:
        assert peek_auto_launch(path) is False
    finally:
        os.unlink(path)


def test_peek_auto_launch_key_absent():
    with tempfile.NamedTemporaryFile(suffix=".json", delete=False, mode="w") as f:
        json.dump({"sv_name": "Test"}, f)
        path = f.name
    try:
        assert peek_auto_launch(path) is False
    finally:
        os.unlink(path)


def test_peek_auto_launch_file_missing():
    assert peek_auto_launch("/nonexistent/path.json") is False
