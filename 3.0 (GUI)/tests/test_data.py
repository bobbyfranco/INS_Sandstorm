import sys, os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))

from src.data import get_gamemode, is_team_based, get_maps, MUTATORS, generate_map_cycle_lines, is_valid_steam_id, is_valid_mod_id


def test_get_gamemode_checkpoint():
    gm = get_gamemode(1)
    assert gm["name"] == "Checkpoint"
    assert gm["mode"] == "Checkpoint"
    assert gm["team_based"] is True


def test_get_gamemode_unknown_returns_none():
    assert get_gamemode(99) is None


def test_is_team_based_checkpoint():
    assert is_team_based(1) is True

def test_is_team_based_push():
    assert is_team_based(7) is True

def test_is_team_based_outpost():
    assert is_team_based(3) is False


def test_get_maps_checkpoint_security():
    maps = get_maps(1, team=1)
    assert len(maps) == 19
    assert maps[0] == ("Hideout", "Town?Scenario=Scenario_Hideout_Checkpoint_Security")


def test_get_maps_checkpoint_insurgents():
    maps = get_maps(1, team=2)
    assert len(maps) == 19
    assert maps[0] == ("Hideout", "Town?Scenario=Scenario_Hideout_Checkpoint_Insurgents")


def test_get_maps_hardcore_checkpoint_same_as_checkpoint():
    assert get_maps(2, team=1) == get_maps(1, team=1)


def test_get_maps_outpost_19():
    maps = get_maps(3)
    assert len(maps) == 19
    assert maps[0] == ("Hideout", "Town?Scenario=Scenario_Hideout_Outpost")


def test_get_maps_tutorial_fixed():
    maps = get_maps(14)
    assert maps == [("Tutorial", "Town?Scenario=Scenario_Hideout_Tutorial")]


def test_get_maps_range_fixed():
    maps = get_maps(15)
    assert maps == [("Range", "Farmhouse?Scenario=Scenario_Farmhouse_Range")]


def test_mutators_total_68():
    assert sum(len(v) for v in MUTATORS.values()) == 68


def test_mutators_has_vanilla_hardcore():
    assert "Hardcore" in MUTATORS["Vanilla"]


def test_mutators_has_vanilla_fullyloaded():
    assert "FullyLoaded" in MUTATORS["Vanilla"]


def test_map_cycle_outpost_no_night():
    lines = generate_map_cycle_lines(3)
    assert len(lines) == 19
    assert lines[0] == '(Scenario="Scenario_Hideout_Outpost",Lighting="Day")'
    assert not any('Lighting="Night"' in l for l in lines)

def test_map_cycle_outpost_with_night():
    lines = generate_map_cycle_lines(3, include_night=True)
    assert len(lines) == 38
    assert lines[0] == '(Scenario="Scenario_Hideout_Outpost",Lighting="Day")'
    assert lines[1] == '(Scenario="Scenario_Hideout_Outpost",Lighting="Night")'

def test_map_cycle_invalid_gamemode_returns_empty():
    assert generate_map_cycle_lines(0) == []

def test_map_cycle_checkpoint_security():
    lines = generate_map_cycle_lines(1, team=1)
    assert len(lines) == 19
    assert 'Scenario="Scenario_Hideout_Checkpoint_Security"' in lines[0]

def test_map_cycle_checkpoint_insurgents():
    lines = generate_map_cycle_lines(1, team=2)
    assert len(lines) == 19
    assert 'Scenario="Scenario_Hideout_Checkpoint_Insurgents"' in lines[0]


def test_is_valid_steam_id_valid():
    assert is_valid_steam_id("76561198000000000") is True

def test_is_valid_steam_id_wrong_length():
    assert is_valid_steam_id("7656119800000000") is False   # 16 digits

def test_is_valid_steam_id_wrong_prefix():
    assert is_valid_steam_id("12345678901234567") is False

def test_is_valid_steam_id_non_numeric():
    assert is_valid_steam_id("7656119800000000x") is False

def test_is_valid_mod_id_valid():
    assert is_valid_mod_id("12345") is True

def test_is_valid_mod_id_non_numeric():
    assert is_valid_mod_id("abc") is False

def test_is_valid_mod_id_empty():
    assert is_valid_mod_id("") is False
