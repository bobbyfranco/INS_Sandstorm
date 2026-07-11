GAMEMODES = [
    {"idx": 1,  "name": "Checkpoint",         "mode": "Checkpoint",     "team_based": True,  "fixed_map": None,                                           "category": "coop"},
    {"idx": 2,  "name": "Hardcore Checkpoint", "mode": "Checkpoint",     "team_based": True,  "fixed_map": None,                                           "category": "coop"},
    {"idx": 3,  "name": "Outpost",             "mode": "Outpost",        "team_based": False, "fixed_map": None,                                           "category": "coop"},
    {"idx": 4,  "name": "Survival",            "mode": "Survival",       "team_based": False, "fixed_map": None,                                           "category": "coop"},
    {"idx": 5,  "name": "Frontline",           "mode": "Frontline",      "team_based": False, "fixed_map": None,                                           "category": "versus"},
    {"idx": 6,  "name": "Team Deathmatch",     "mode": "TeamDeathmatch", "team_based": False, "fixed_map": None,                                           "category": "versus"},
    {"idx": 7,  "name": "Push",                "mode": "Push",           "team_based": True,  "fixed_map": None,                                           "category": "versus"},
    {"idx": 8,  "name": "Ambush",              "mode": "Ambush",         "team_based": False, "fixed_map": None,                                           "category": "versus"},
    {"idx": 9,  "name": "Defusal",             "mode": "Defusal",        "team_based": False, "fixed_map": None,                                           "category": "versus"},
    {"idx": 10, "name": "Domination",          "mode": "Domination",     "team_based": False, "fixed_map": None,                                           "category": "versus"},
    {"idx": 11, "name": "Free For All",        "mode": "FFA",            "team_based": False, "fixed_map": None,                                           "category": "versus"},
    {"idx": 12, "name": "Firefight",           "mode": "Firefight",      "team_based": False, "fixed_map": None,                                           "category": "versus"},
    {"idx": 13, "name": "Skirmish",            "mode": "Skirmish",       "team_based": False, "fixed_map": None,                                           "category": "versus"},
    {"idx": 14, "name": "Tutorial",            "mode": "Tutorial",       "team_based": False, "fixed_map": "Town?Scenario=Scenario_Hideout_Tutorial",       "category": "special"},
    {"idx": 15, "name": "Range",               "mode": "Range",          "team_based": False, "fixed_map": "Farmhouse?Scenario=Scenario_Farmhouse_Range",  "category": "special"},
    {"idx": 16, "name": "Interception",        "mode": "Interception",   "team_based": False, "fixed_map": "Forest?Scenario=Scenario_Forest_Interception", "category": "special"},
]

_CHECKPOINT_MAPS = [
    {"name": "Hideout",    "security": "Town?Scenario=Scenario_Hideout_Checkpoint_Security",        "insurgents": "Town?Scenario=Scenario_Hideout_Checkpoint_Insurgents"},
    {"name": "Precinct",   "security": "Precinct?Scenario=Scenario_Precinct_Checkpoint_Security",   "insurgents": "Precinct?Scenario=Scenario_Precinct_Checkpoint_Insurgents"},
    {"name": "Refinery",   "security": "OilField?Scenario=Scenario_Refinery_Checkpoint_Security",   "insurgents": "OilField?Scenario=Scenario_Refinery_Checkpoint_Insurgents"},
    {"name": "Farmhouse",  "security": "Farmhouse?Scenario=Scenario_Farmhouse_Checkpoint_Security", "insurgents": "Farmhouse?Scenario=Scenario_Farmhouse_Checkpoint_Insurgents"},
    {"name": "Summit",     "security": "Mountain?Scenario=Scenario_Summit_Checkpoint_Security",     "insurgents": "Mountain?Scenario=Scenario_Summit_Checkpoint_Insurgents"},
    {"name": "Citadel",    "security": "Citadel?Scenario=Scenario_Citadel_Checkpoint_Security",     "insurgents": "Citadel?Scenario=Scenario_Citadel_Checkpoint_Insurgents"},
    {"name": "Bab",        "security": "Bab?Scenario=Scenario_Bab_Checkpoint_Security",             "insurgents": "Bab?Scenario=Scenario_Bab_Checkpoint_Insurgents"},
    {"name": "Gap",        "security": "Gap?Scenario=Scenario_Gap_Checkpoint_Security",             "insurgents": "Gap?Scenario=Scenario_Gap_Checkpoint_Insurgents"},
    {"name": "Hillside",   "security": "Sinjar?Scenario=Scenario_Hillside_Checkpoint_Security",     "insurgents": "Sinjar?Scenario=Scenario_Hillside_Checkpoint_Insurgents"},
    {"name": "Ministry",   "security": "Ministry?Scenario=Scenario_Ministry_Checkpoint_Security",   "insurgents": "Ministry?Scenario=Scenario_Ministry_Checkpoint_Insurgents"},
    {"name": "Outskirts",  "security": "Compound?Scenario=Scenario_Outskirts_Checkpoint_Security",  "insurgents": "Compound?Scenario=Scenario_Outskirts_Checkpoint_Insurgents"},
    {"name": "PowerPlant", "security": "PowerPlant?Scenario=Scenario_PowerPlant_Checkpoint_Security","insurgents": "PowerPlant?Scenario=Scenario_PowerPlant_Checkpoint_Insurgents"},
    {"name": "Tell",       "security": "Tell?Scenario=Scenario_Tell_Checkpoint_Security",           "insurgents": "Tell?Scenario=Scenario_Tell_Checkpoint_Insurgents"},
    {"name": "Tideway",    "security": "Buhriz?Scenario=Scenario_Tideway_Checkpoint_Security",      "insurgents": "Buhriz?Scenario=Scenario_Tideway_Checkpoint_Insurgents"},
    {"name": "Prison",     "security": "Prison?Scenario=Scenario_Prison_Checkpoint_Security",       "insurgents": "Prison?Scenario=Scenario_Prison_Checkpoint_Insurgents"},
    {"name": "LastLight",  "security": "LastLight?Scenario=Scenario_LastLight_Checkpoint_Security", "insurgents": "LastLight?Scenario=Scenario_LastLight_Checkpoint_Insurgents"},
    {"name": "Trainyard",  "security": "TrainYard?Scenario=Scenario_Trainyard_Checkpoint_Security", "insurgents": "TrainYard?Scenario=Scenario_Trainyard_Checkpoint_Insurgents"},
    {"name": "Forest",     "security": "Forest?Scenario=Scenario_Forest_Checkpoint_Security",       "insurgents": "Forest?Scenario=Scenario_Forest_Checkpoint_Insurgents"},
    {"name": "Crossing",   "security": "Canyon?Scenario=Scenario_Crossing_Checkpoint_Security",     "insurgents": "Canyon?Scenario=Scenario_Crossing_Checkpoint_Insurgents"},
]

_PUSH_MAPS = [
    {"name": "Hideout",    "security": "Town?Scenario=Scenario_Hideout_Push_Security",        "insurgents": "Town?Scenario=Scenario_Hideout_Push_Insurgents"},
    {"name": "Precinct",   "security": "Precinct?Scenario=Scenario_Precinct_Push_Security",   "insurgents": "Precinct?Scenario=Scenario_Precinct_Push_Insurgents"},
    {"name": "Refinery",   "security": "OilField?Scenario=Scenario_Refinery_Push_Security",   "insurgents": "OilField?Scenario=Scenario_Refinery_Push_Insurgents"},
    {"name": "Farmhouse",  "security": "Farmhouse?Scenario=Scenario_Farmhouse_Push_Security", "insurgents": "Farmhouse?Scenario=Scenario_Farmhouse_Push_Insurgents"},
    {"name": "Summit",     "security": "Mountain?Scenario=Scenario_Summit_Push_Security",     "insurgents": "Mountain?Scenario=Scenario_Summit_Push_Insurgents"},
    {"name": "Citadel",    "security": "Citadel?Scenario=Scenario_Citadel_Push_Security",     "insurgents": "Citadel?Scenario=Scenario_Citadel_Push_Insurgents"},
    {"name": "Bab",        "security": "Bab?Scenario=Scenario_Bab_Push_Security",             "insurgents": "Bab?Scenario=Scenario_Bab_Push_Insurgents"},
    {"name": "Gap",        "security": "Gap?Scenario=Scenario_Gap_Push_Security",             "insurgents": "Gap?Scenario=Scenario_Gap_Push_Insurgents"},
    {"name": "Hillside",   "security": "Sinjar?Scenario=Scenario_Hillside_Push_Security",      "insurgents": "Sinjar?Scenario=Scenario_Hillside_Push_Insurgents"},
    {"name": "Ministry",   "security": "Ministry?Scenario=Scenario_Ministry_Push_Security",    "insurgents": "Ministry?Scenario=Scenario_Ministry_Push_Insurgents"},
    {"name": "Outskirts",  "security": "Compound?Scenario=Scenario_Outskirts_Push_Security",   "insurgents": "Compound?Scenario=Scenario_Outskirts_Push_Insurgents"},
    {"name": "PowerPlant", "security": "PowerPlant?Scenario=Scenario_PowerPlant_Push_Security","insurgents": "PowerPlant?Scenario=Scenario_PowerPlant_Push_Insurgents"},
    {"name": "Tell",       "security": "Tell?Scenario=Scenario_Tell_Push_Security",           "insurgents": "Tell?Scenario=Scenario_Tell_Push_Insurgents"},
    {"name": "Tideway",    "security": "Buhriz?Scenario=Scenario_Tideway_Push_Security",      "insurgents": "Buhriz?Scenario=Scenario_Tideway_Push_Insurgents"},
    {"name": "Prison",     "security": "Prison?Scenario=Scenario_Prison_Push_Security",       "insurgents": "Prison?Scenario=Scenario_Prison_Push_Insurgents"},
    {"name": "LastLight",  "security": "LastLight?Scenario=Scenario_LastLight_Push_Security", "insurgents": "LastLight?Scenario=Scenario_LastLight_Push_Insurgents"},
    {"name": "Trainyard",  "security": "TrainYard?Scenario=Scenario_Trainyard_Push_Security", "insurgents": "TrainYard?Scenario=Scenario_Trainyard_Push_Insurgents"},
    {"name": "Forest",     "security": "Forest?Scenario=Scenario_Forest_Push_Security",       "insurgents": "Forest?Scenario=Scenario_Forest_Push_Insurgents"},
    {"name": "Crossing",   "security": "Canyon?Scenario=Scenario_Crossing_Push_Security",     "insurgents": "Canyon?Scenario=Scenario_Crossing_Push_Insurgents"},
]

_OUTPOST_MAPS = [
    {"name": "Hideout",    "value": "Town?Scenario=Scenario_Hideout_Outpost"},
    {"name": "Precinct",   "value": "Precinct?Scenario=Scenario_Precinct_Outpost"},
    {"name": "Refinery",   "value": "OilField?Scenario=Scenario_Refinery_Outpost"},
    {"name": "Farmhouse",  "value": "Farmhouse?Scenario=Scenario_Farmhouse_Outpost"},
    {"name": "Summit",     "value": "Mountain?Scenario=Scenario_Summit_Outpost"},
    {"name": "Citadel",    "value": "Citadel?Scenario=Scenario_Citadel_Outpost"},
    {"name": "Bab",        "value": "Bab?Scenario=Scenario_Bab_Outpost"},
    {"name": "Gap",        "value": "Gap?Scenario=Scenario_Gap_Outpost"},
    {"name": "Hillside",   "value": "Sinjar?Scenario=Scenario_Hillside_Outpost"},
    {"name": "Ministry",   "value": "Ministry?Scenario=Scenario_Ministry_Outpost"},
    {"name": "Outskirts",  "value": "Compound?Scenario=Scenario_Outskirts_Outpost"},
    {"name": "PowerPlant", "value": "PowerPlant?Scenario=Scenario_PowerPlant_Outpost"},
    {"name": "Tell",       "value": "Tell?Scenario=Scenario_Tell_Outpost"},
    {"name": "Tideway",    "value": "Buhriz?Scenario=Scenario_Tideway_Outpost"},
    {"name": "Prison",     "value": "Prison?Scenario=Scenario_Prison_Outpost"},
    {"name": "LastLight",  "value": "LastLight?Scenario=Scenario_LastLight_Outpost"},
    {"name": "Trainyard",  "value": "TrainYard?Scenario=Scenario_Trainyard_Outpost"},
    {"name": "Forest",     "value": "Forest?Scenario=Scenario_Forest_Outpost"},
    {"name": "Crossing",   "value": "Canyon?Scenario=Scenario_Crossing_Outpost"},
]

_SURVIVAL_MAPS = [
    {"name": "Hideout",    "value": "Town?Scenario=Scenario_Hideout_Survival"},
    {"name": "Precinct",   "value": "Precinct?Scenario=Scenario_Precinct_Survival"},
    {"name": "Refinery",   "value": "OilField?Scenario=Scenario_Refinery_Survival"},
    {"name": "Farmhouse",  "value": "Farmhouse?Scenario=Scenario_Farmhouse_Survival"},
    {"name": "Summit",     "value": "Mountain?Scenario=Scenario_Summit_Survival"},
    {"name": "Citadel",    "value": "Citadel?Scenario=Scenario_Citadel_Survival"},
    {"name": "Bab",        "value": "Bab?Scenario=Scenario_Bab_Survival"},
    {"name": "Gap",        "value": "Gap?Scenario=Scenario_Gap_Survival"},
    {"name": "Hillside",   "value": "Sinjar?Scenario=Scenario_Hillside_Survival"},
    {"name": "Ministry",   "value": "Ministry?Scenario=Scenario_Ministry_Survival"},
    {"name": "Outskirts",  "value": "Compound?Scenario=Scenario_Outskirts_Survival"},
    {"name": "PowerPlant", "value": "PowerPlant?Scenario=Scenario_PowerPlant_Survival"},
    {"name": "Tell",       "value": "Tell?Scenario=Scenario_Tell_Survival"},
    {"name": "Tideway",    "value": "Buhriz?Scenario=Scenario_Tideway_Survival"},
    {"name": "Prison",     "value": "Prison?Scenario=Scenario_Prison_Survival"},
    {"name": "LastLight",  "value": "LastLight?Scenario=Scenario_LastLight_Survival"},
    {"name": "Trainyard",  "value": "TrainYard?Scenario=Scenario_Trainyard_Survival"},
    {"name": "Forest",     "value": "Forest?Scenario=Scenario_Forest_Survival"},
    {"name": "Crossing",   "value": "Canyon?Scenario=Scenario_Crossing_Survival"},
]

_FRONTLINE_MAPS = [
    {"name": "Hideout",    "value": "Town?Scenario=Scenario_Hideout_Frontline"},
    {"name": "Precinct",   "value": "Precinct?Scenario=Scenario_Precinct_Frontline"},
    {"name": "Refinery",   "value": "OilField?Scenario=Scenario_Refinery_Frontline"},
    {"name": "Farmhouse",  "value": "Farmhouse?Scenario=Scenario_Farmhouse_Frontline"},
    {"name": "Summit",     "value": "Mountain?Scenario=Scenario_Summit_Frontline"},
    {"name": "Citadel",    "value": "Citadel?Scenario=Scenario_Citadel_Frontline"},
    {"name": "Bab",        "value": "Bab?Scenario=Scenario_Bab_Frontline"},
    {"name": "Gap",        "value": "Gap?Scenario=Scenario_Gap_Frontline"},
    {"name": "Hillside",   "value": "Sinjar?Scenario=Scenario_Hillside_Frontline"},
    {"name": "Ministry",   "value": "Ministry?Scenario=Scenario_Ministry_Frontline"},
    {"name": "Outskirts",  "value": "Compound?Scenario=Scenario_Outskirts_Frontline"},
    {"name": "PowerPlant", "value": "PowerPlant?Scenario=Scenario_PowerPlant_Frontline"},
    {"name": "Tell",       "value": "Tell?Scenario=Scenario_Tell_Frontline"},
    {"name": "Tideway",    "value": "Buhriz?Scenario=Scenario_Tideway_Frontline"},
    {"name": "Prison",     "value": "Prison?Scenario=Scenario_Prison_Frontline"},
    {"name": "LastLight",  "value": "LastLight?Scenario=Scenario_LastLight_Frontline"},
    {"name": "Trainyard",  "value": "TrainYard?Scenario=Scenario_Trainyard_Frontline"},
    {"name": "Forest",     "value": "Forest?Scenario=Scenario_Forest_Frontline"},
    {"name": "Crossing",   "value": "Canyon?Scenario=Scenario_Crossing_Frontline"},
]

_TDM_MAPS = [
    {"name": "Hideout",    "value": "Town?Scenario=Scenario_Hideout_Team_Deathmatch"},
    {"name": "Precinct",   "value": "Precinct?Scenario=Scenario_Precinct_Team_Deathmatch"},
    {"name": "Refinery",   "value": "OilField?Scenario=Scenario_Refinery_Team_Deathmatch"},
    {"name": "Farmhouse",  "value": "Farmhouse?Scenario=Scenario_Farmhouse_Team_Deathmatch"},
    {"name": "Summit",     "value": "Mountain?Scenario=Scenario_Summit_Team_Deathmatch"},
    {"name": "Citadel",    "value": "Citadel?Scenario=Scenario_Citadel_TDM_Small"},
    {"name": "Gap",        "value": "Gap?Scenario=Scenario_Gap_TDM"},
    {"name": "Ministry",   "value": "Ministry?Scenario=Scenario_Ministry_Team_Deathmatch"},
    {"name": "Outskirts",  "value": "Compound?Scenario=Scenario_Outskirts_Team_Deathmatch"},
    {"name": "Prison",     "value": "Prison?Scenario=Scenario_Prison_TDM"},
    {"name": "LastLight",  "value": "LastLight?Scenario=Scenario_LastLight_TDM"},
    {"name": "Forest",     "value": "Forest?Scenario=Scenario_Forest_TDM"},
    {"name": "Crossing",   "value": "Canyon?Scenario=Scenario_Crossing_Team_Deathmatch"},
]

_AMBUSH_MAPS = [
    {"name": "Hideout",         "value": "Town?Scenario=Scenario_Hideout_Ambush"},
    {"name": "Hideout East",    "value": "Town?Scenario=Scenario_Hideout_Ambush_East"},
    {"name": "Precinct",        "value": "Precinct?Scenario=Scenario_Precinct_Ambush"},
    {"name": "Precinct East",   "value": "Precinct?Scenario=Scenario_Precinct_Ambush_East"},
    {"name": "Refinery",        "value": "OilField?Scenario=Scenario_Refinery_Ambush"},
    {"name": "Farmhouse",       "value": "Farmhouse?Scenario=Scenario_Farmhouse_Ambush"},
    {"name": "Summit East",     "value": "Mountain?Scenario=Scenario_Summit_Ambush_East"},
    {"name": "Summit West",     "value": "Mountain?Scenario=Scenario_Summit_Ambush_West"},
    {"name": "Citadel",         "value": "Citadel?Scenario=Scenario_Citadel_Ambush"},
    {"name": "Bab",             "value": "Bab?Scenario=Scenario_Bab_Ambush"},
    {"name": "Gap",             "value": "Gap?Scenario=Scenario_Gap_Ambush"},
    {"name": "Hillside",        "value": "Sinjar?Scenario=Scenario_Hillside_Ambush"},
    {"name": "Ministry",        "value": "Ministry?Scenario=Scenario_Ministry_Ambush"},
    {"name": "Outskirts",       "value": "Compound?Scenario=Scenario_Outskirts_Ambush"},
    {"name": "Outskirts East",  "value": "Compound?Scenario=Scenario_Outskirts_Ambush_East"},
    {"name": "PowerPlant",      "value": "PowerPlant?Scenario=Scenario_PowerPlant_Ambush"},
    {"name": "Tell East",       "value": "Tell?Scenario=Scenario_Tell_Ambush_East"},
    {"name": "Tell West",       "value": "Tell?Scenario=Scenario_Tell_Ambush_West"},
    {"name": "Tideway",         "value": "Buhriz?Scenario=Scenario_Tideway_Ambush"},
    {"name": "Prison",          "value": "Prison?Scenario=Scenario_Prison_Ambush"},
    {"name": "LastLight",       "value": "LastLight?Scenario=Scenario_LastLight_Ambush"},
    {"name": "Trainyard East",  "value": "TrainYard?Scenario=Scenario_TrainYard_Ambush_East"},
    {"name": "Trainyard West",  "value": "TrainYard?Scenario=Scenario_TrainYard_Ambush_West"},
    {"name": "Forest",          "value": "Forest?Scenario=Scenario_Forest_Ambush"},
    {"name": "Crossing",        "value": "Canyon?Scenario=Scenario_Crossing_Ambush"},
]

_DEFUSAL_MAPS = [
    {"name": "Hideout",         "value": "Town?Scenario=Scenario_Hideout_Defusal"},
    {"name": "Precinct",        "value": "Precinct?Scenario=Scenario_Precinct_Defusal"},
    {"name": "Refinery",        "value": "OilField?Scenario=Scenario_Refinery_Defusal"},
    {"name": "Farmhouse",       "value": "FarmHouse?Scenario=Scenario_Farmhouse_Defusal"},
    {"name": "Summit",          "value": "Mountain?Scenario=Scenario_Summit_Defusal"},
    {"name": "Citadel",         "value": "Citadel?Scenario=Scenario_Citadel_Defusal"},
    {"name": "Bab",             "value": "Bab?Scenario=Scenario_Bab_Defusal"},
    {"name": "Gap",             "value": "Gap?Scenario=Scenario_Gap_Defusal"},
    {"name": "Hillside",        "value": "Sinjar?Scenario=Scenario_Hillside_Defusal"},
    {"name": "Ministry",        "value": "Ministry?Scenario=Scenario_Ministry_Defusal"},
    {"name": "Outskirts",       "value": "Compound?Scenario=Scenario_Outskirts_Defusal"},
    {"name": "PowerPlant",      "value": "PowerPlant?Scenario=Scenario_PowerPlant_Defusal"},
    {"name": "Tell",            "value": "Tell?Scenario=Scenario_Tell_Defusal"},
    {"name": "Tideway",         "value": "Buhriz?Scenario=Scenario_Tideway_Defusal"},
    {"name": "Prison",          "value": "Prison?Scenario=Scenario_Prison_Defusal"},
    {"name": "LastLight",       "value": "LastLight?Scenario=Scenario_LastLight_Defusal"},
    {"name": "Trainyard East",  "value": "TrainYard?Scenario=Scenario_TrainYard_Defusal_East"},
    {"name": "Trainyard West",  "value": "TrainYard?Scenario=Scenario_TrainYard_Defusal_West"},
    {"name": "Forest",          "value": "Forest?Scenario=Scenario_Forest_Defusal"},
    {"name": "Crossing",        "value": "Canyon?Scenario=Scenario_Crossing_Defusal"},
]

_DOMINATION_MAPS = [
    {"name": "Hideout",         "value": "Town?Scenario=Scenario_Hideout_Domination"},
    {"name": "Precinct East",   "value": "Precinct?Scenario=Scenario_Precinct_Domination_East"},
    {"name": "Precinct West",   "value": "Precinct?Scenario=Scenario_Precinct_Domination_West"},
    {"name": "Refinery",        "value": "OilField?Scenario=Scenario_Refinery_Domination"},
    {"name": "Farmhouse",       "value": "Farmhouse?Scenario=Scenario_Farmhouse_Domination"},
    {"name": "Summit",          "value": "Mountain?Scenario=Scenario_Summit_Domination"},
    {"name": "Citadel",         "value": "Citadel?Scenario=Scenario_Citadel_Domination"},
    {"name": "Bab",             "value": "Bab?Scenario=Scenario_Bab_Domination"},
    {"name": "Gap East",        "value": "Gap?Scenario=Scenario_Gap_Domination_East"},
    {"name": "Gap West",        "value": "Gap?Scenario=Scenario_Gap_Domination_West"},
    {"name": "Hillside",        "value": "Sinjar?Scenario=Scenario_Hillside_Domination"},
    {"name": "Ministry",        "value": "Ministry?Scenario=Scenario_Ministry_Domination"},
    {"name": "Outskirts",       "value": "Compound?Scenario=Scenario_Outskirts_Domination"},
    {"name": "PowerPlant",      "value": "PowerPlant?Scenario=Scenario_PowerPlant_Domination"},
    {"name": "Tell East",       "value": "Tell?Scenario=Scenario_Tell_Domination_East"},
    {"name": "Tell West",       "value": "Tell?Scenario=Scenario_Tell_Domination_West"},
    {"name": "Tideway",         "value": "Buhriz?Scenario=Scenario_Tideway_Domination"},
    {"name": "Prison",          "value": "Prison?Scenario=Scenario_Prison_Domination"},
    {"name": "LastLight",       "value": "LastLight?Scenario=Scenario_LastLight_Domination"},
    {"name": "Trainyard East",  "value": "TrainYard?Scenario=Scenario_TrainYard_Domination_East"},
    {"name": "Trainyard West",  "value": "TrainYard?Scenario=Scenario_TrainYard_Domination_West"},
    {"name": "Forest",          "value": "Forest?Scenario=Scenario_Forest_Domination"},
    {"name": "Crossing",        "value": "Canyon?Scenario=Scenario_Crossing_Domination"},
]

_FFA_MAPS = [
    {"name": "Precinct",   "value": "Precinct?Scenario=Scenario_Precinct_FFA"},
    {"name": "PowerPlant", "value": "PowerPlant?Scenario=Scenario_PowerPlant_FFA"},
    {"name": "Tell",       "value": "Tell?Scenario=Scenario_Tell_FFA"},
    {"name": "Prison",     "value": "Prison?Scenario=Scenario_Prison_FFA"},
    {"name": "Forest",     "value": "Forest?Scenario=Scenario_Forest_FFA"},
    {"name": "Crossing",   "value": "Canyon?Scenario=Scenario_Crossing_FFA"},
]

_FIREFIGHT_MAPS = [
    {"name": "Hideout East",    "value": "Town?Scenario=Scenario_Hideout_Firefight_East"},
    {"name": "Hideout West",    "value": "Town?Scenario=Scenario_Hideout_Firefight_West"},
    {"name": "Precinct East",   "value": "Precinct?Scenario=Scenario_Precinct_Firefight_East"},
    {"name": "Precinct West",   "value": "Precinct?Scenario=Scenario_Precinct_Firefight_West"},
    {"name": "Refinery West",   "value": "OilField?Scenario=Scenario_Refinery_Firefight_West"},
    {"name": "Farmhouse East",  "value": "Farmhouse?Scenario=Scenario_Farmhouse_Firefight_East"},
    {"name": "Farmhouse West",  "value": "Farmhouse?Scenario=Scenario_Farmhouse_Firefight_West"},
    {"name": "Summit East",     "value": "Mountain?Scenario=Scenario_Summit_Firefight_East"},
    {"name": "Summit West",     "value": "Mountain?Scenario=Scenario_Summit_Firefight_West"},
    {"name": "Citadel",         "value": "Citadel?Scenario=Scenario_Citadel_Firefight"},
    {"name": "Bab East",        "value": "Bab?Scenario=Scenario_Bab_Firefight_East"},
    {"name": "Gap",             "value": "Gap?Scenario=Scenario_Gap_Firefight"},
    {"name": "Gap West",        "value": "Gap?Scenario=Scenario_Gap_Firefight_West"},
    {"name": "Hillside East",   "value": "Sinjar?Scenario=Scenario_Hillside_Firefight_East"},
    {"name": "Hillside West",   "value": "Sinjar?Scenario=Scenario_Hillside_Firefight_West"},
    {"name": "Ministry A",      "value": "Ministry?Scenario=Scenario_Ministry_Firefight_A"},
    {"name": "Outskirts East",  "value": "Compound?Scenario=Scenario_Outskirts_Firefight_East"},
    {"name": "Outskirts West",  "value": "Compound?Scenario=Scenario_Outskirts_Firefight_West"},
    {"name": "PowerPlant East", "value": "PowerPlant?Scenario=Scenario_PowerPlant_Firefight_East"},
    {"name": "PowerPlant West", "value": "PowerPlant?Scenario=Scenario_PowerPlant_Firefight_West"},
    {"name": "Tell East",       "value": "Tell?Scenario=Scenario_Tell_Firefight_East"},
    {"name": "Tell West",       "value": "Tell?Scenario=Scenario_Tell_Firefight_West"},
    {"name": "Tideway West",    "value": "Buhriz?Scenario=Scenario_Tideway_Firefight_West"},
    {"name": "Prison",          "value": "Prison?Scenario=Scenario_Prison_Firefight"},
    {"name": "LastLight",       "value": "LastLight?Scenario=Scenario_LastLight_Firefight"},
    {"name": "Trainyard East",  "value": "TrainYard?Scenario=Scenario_TrainYard_Firefight_East"},
    {"name": "Trainyard West",  "value": "TrainYard?Scenario=Scenario_TrainYard_Firefight_West"},
    {"name": "Forest East",     "value": "Forest?Scenario=Scenario_Forest_Firefight_East"},
    {"name": "Forest West",     "value": "Forest?Scenario=Scenario_Forest_Firefight_West"},
    {"name": "Crossing West",   "value": "Canyon?Scenario=Scenario_Crossing_Firefight_West"},
]

_SKIRMISH_MAPS = [
    {"name": "Hideout",    "value": "Town?Scenario=Scenario_Hideout_Skirmish"},
    {"name": "Precinct",   "value": "Precinct?Scenario=Scenario_Precinct_Skirmish"},
    {"name": "Refinery",   "value": "OilField?Scenario=Scenario_Refinery_Skirmish"},
    {"name": "Farmhouse",  "value": "Farmhouse?Scenario=Scenario_Farmhouse_Skirmish"},
    {"name": "Summit",     "value": "Mountain?Scenario=Scenario_Summit_Skirmish"},
    {"name": "Ministry",   "value": "Ministry?Scenario=Scenario_Ministry_Skirmish"},
    {"name": "PowerPlant", "value": "PowerPlant?Scenario=Scenario_PowerPlant_Skirmish"},
    {"name": "Prison",     "value": "Prison?Scenario=Scenario_Prison_Skirmish"},
    {"name": "LastLight",  "value": "LastLight?Scenario=Scenario_LastLight_Skirmish"},
    {"name": "Crossing",   "value": "Canyon?Scenario=Scenario_Crossing_Skirmish"},
]

_TEAM_MAPS = {"Checkpoint": _CHECKPOINT_MAPS, "Push": _PUSH_MAPS}
_SOLO_MAPS = {
    "Outpost": _OUTPOST_MAPS, "Survival": _SURVIVAL_MAPS, "Frontline": _FRONTLINE_MAPS,
    "TeamDeathmatch": _TDM_MAPS, "Ambush": _AMBUSH_MAPS, "Defusal": _DEFUSAL_MAPS,
    "Domination": _DOMINATION_MAPS, "FFA": _FFA_MAPS, "Firefight": _FIREFIGHT_MAPS,
    "Skirmish": _SKIRMISH_MAPS,
}

MUTATORS = {
    "Vanilla": [
        "AllYouCanEat", "AntiMaterielRiflesOnly", "BoltActionsOnly", "Broke",
        "BulletSponge", "Competitive", "CompetitiveLoadouts", "FastMovement",
        "Frenzy", "FullyLoaded", "Guerrillas", "Hardcore", "HeadshotOnly", "HotPotato",
        "LockedAim", "NoAim", "PistolsOnly", "ShotgunsOnly", "SlowCaptureTimes",
        "SlowMovement", "SoldierOfFortune", "SpecialOperations", "Strapped",
        "Ultralethal", "Vampirism", "Warlords",
    ],
    "ISMC Mod": [
        "ISMCarmory_Legacy", "ISMC_Casual", "ISMC_Hardcore", "ISMC_Karmacore",
        "ISMCHighReady", "ISMCHardcoreMovement", "ISMCHardcoreMovementNHR",
        "ISMCKarmacoreMovement", "ISMCKarmacoreMovementNHR", "ISMCJumpShoot",
    ],
    "ISMC 2 Mod": [
        "ISMCGunfighter", "ISMCGunfighter_Tac", "ISMCGunfighter_Legacy",
        "ISMCGunfighter_Tac_Legacy", "TacticalMovement", "TacticalMovementHC",
        "CasualMovement", "CasualMovementHC", "OldSchoolMovement", "90sMovement",
        "ModernMovement", "HCMovement", "CasualMovementMW", "TacticalHealth",
        "CasualHealth", "OldSchoolHealth", "AdvancedObjectives", "SuppliedObjectives",
        "DisableFS",
    ],
    "Other Mods": [
        "NoRestrictedAreas", "EventMessenger", "WelcomeMessage", "FPLegsPlus",
        "MoreAmmo", "Reloads", "HealthRegen", "MapVoteLabels", "CoopHUD",
        "ImprovedAI", "ImprovedAI_2", "ImprovedAI_3", "ImprovedAI_4",
    ],
}


def get_gamemode(idx: int) -> dict | None:
    return next((gm for gm in GAMEMODES if gm["idx"] == idx), None)


def is_team_based(gamemode_idx: int) -> bool:
    gm = get_gamemode(gamemode_idx)
    return bool(gm and gm["team_based"])


def get_maps(gamemode_idx: int, team: int = 1) -> list[tuple[str, str]]:
    """Return (display_name, map_value) pairs. team: 1=Security, 2=Insurgents."""
    gm = get_gamemode(gamemode_idx)
    if not gm:
        return []
    if gm["fixed_map"]:
        return [(gm["name"], gm["fixed_map"])]
    if gm["team_based"]:
        entries = _TEAM_MAPS.get(gm["mode"], [])
        key = "security" if team == 1 else "insurgents"
        return [(e["name"], e[key]) for e in entries]
    entries = _SOLO_MAPS.get(gm["mode"], [])
    return [(e["name"], e["value"]) for e in entries]


def random_map(gamemode_idx: int, team: int = 1) -> str | None:
    import random
    maps = get_maps(gamemode_idx, team)
    return random.choice(maps)[1] if maps else None


def generate_map_cycle_lines(gamemode_idx: int, team: int = 1, include_night: bool = False) -> list[str]:
    lines = []
    for _, map_value in get_maps(gamemode_idx, team):
        scenario = map_value.split("=", 1)[1] if "=" in map_value else map_value
        lines.append(f'(Scenario="{scenario}",Lighting="Day")')
        if include_night:
            lines.append(f'(Scenario="{scenario}",Lighting="Night")')
    return lines


def is_valid_steam_id(value: str) -> bool:
    return len(value) == 17 and value.isdigit() and value.startswith("7656119")


def is_valid_mod_id(value: str) -> bool:
    return bool(value) and value.isdigit()
