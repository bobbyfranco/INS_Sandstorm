from __future__ import annotations
from PyQt5.QtWidgets import QWidget, QVBoxLayout, QTextBrowser

_HELP_HTML = """
<style>
  body { font-family: Segoe UI, Arial, sans-serif; font-size: 13px; margin: 12px; }
  h2 { color: #2a6099; margin-bottom: 4px; }
  h3 { color: #3a3a3a; margin-top: 16px; margin-bottom: 4px; text-decoration: underline; }
  p  { margin: 4px 0 8px 0; line-height: 1.5; }
  code { background: #f0f0f0; padding: 1px 4px; border-radius: 3px; font-family: Consolas, Courier New; }
  b  { color: #222; }
</style>

<h2>Insurgency Sandstorm Advanced Server Launcher - Help</h2>

<h3>Server Tab</h3>
<p>
<b>Server Name:</b> The name displayed to players in the server browser.<br>
<b>IPv4 Address:</b> Your server's local IP (auto-detected on launch). Used by the two toggles below.<br>
<b>Parse IP</b> (<code>-MultiHome=&lt;ip&gt;</code>): Binds the server to a specific network interface.
Use this on machines with multiple network adapters (NICs) to control which one the server listens on.<br>
<b>Broadcast IP</b> (<code>-broadcastip=&lt;ip&gt;</code>): The IP the server advertises to the master server for
player discovery. Use this when behind NAT to specify your public-facing IP.<br>
Both toggles are independent and both use the IPv4 Address field. They are disabled when the IP field is empty.<br>
<b>Max Players:</b> Concurrent player limit (1–32).<br>
<b>Game Port:</b> UDP port the server listens on (default: 27102).<br>
<b>Query Port:</b> UDP port for Steam server queries (default: 27131).<br>
<b>Server Exe:</b> Path to <code>InsurgencyServer.exe</code>. Required to launch.<br>
<b>Open Game.ini / Engine.ini:</b> Opens the server config files in your default editor.
Start the server once to generate them if they don't exist yet.<br>
<b>Save / Load Config:</b> Saves or loads all settings to <code>launcher_config.json</code>
next to the launcher.
</p>

<h3>Game Tab</h3>
<p>
<b>Gamemode:</b> Grouped into Co-op (Checkpoint, Hardcore Checkpoint, Outpost, Survival),
Versus (Frontline, Team Deathmatch, Push, Ambush, Defusal, Domination, Free For All, Firefight, Skirmish),
and Special (Tutorial, Range, Interception).
Hardcore Checkpoint automatically includes the Hardcore mutator in the launch command.<br>
<b>Team:</b> Security or Insurgents. Only applies to team-based gamemodes (Checkpoint, Hardcore Checkpoint, Push).
Switching team preserves your current map selection.<br>
<b>Map:</b> The scenario to load. Available maps update based on gamemode and team.<br>
<b>Lighting:</b> Day or Night.
</p>

<h3>Mutators Tab</h3>
<p>
Optional gameplay modifiers, 68 total across four categories:<br>
<b>Vanilla</b> (26): standard game mutators, no mods required.<br>
<b>ISMC Mod</b> (10): requires the ISMC mod.<br>
<b>ISMC 2 Mod</b> (19): requires the ISMC 2 mod.<br>
<b>Other Mods</b> (13): requires various community mods.<br>
Hardened gamemode always prepends Hardcore regardless of your mutator selection.
</p>

<h3>Auth Tab</h3>
<p>
<b>GSLT Token:</b> 32-character Steam Game Server Login Token from Steamworks
(<a href="https://steamcommunity.com/dev/managegameservers">get token</a>).
Required for your server to appear in the public server browser.<br>
<b>Game Stats Token:</b> 32-character token from NWI for stat tracking
(<a href="https://gamestats.sandstorm.game/auth/login">get token</a>). Optional.<br>
Tokens shorter or longer than 32 characters are silently ignored.
</p>

<h3>Password Tab</h3>
<p>
Adds <code>-password=&lt;value&gt;</code> to the launch command.
The password is only appended when the Enable toggle is checked -
entering text in the field alone has no effect.
</p>

<h3>MOTD Tab</h3>
<p>
Creates <code>MOTD.txt</code> in the server config directory and adds <code>-motd</code> to the
launch command when enabled. The message is shown to players when they connect.
</p>

<h3>Map Cycle Tab</h3>
<p>
Creates <code>MapCycle.txt</code> in the server config directory and adds
<code>-MapCycle=MapCycle.txt</code> to the launch command when enabled.<br>
Format: <code>(Scenario="...",Lighting="Day/Night")</code>, one entry per line.<br>
Use <b>Generate</b> to build a cycle from the current gamemode and team, then edit freely.
The editor is not overwritten when you change other settings - only when you click Generate.
</p>

<h3>Admins Tab</h3>
<p>
Creates <code>Admins.txt</code> in the server config directory.
One SteamID64 per line (17 digits, starting with <code>7656119</code>).
Admins have in-game moderation powers on the server.
</p>

<h3>Mods Tab</h3>
<p>
Creates <code>Mods.txt</code> in the server config directory and adds
<code>-Mods -ModDownloadTravelTo=&lt;map&gt;</code> to the launch command when enabled.
One numeric mod ID per line - find IDs on <b>mod.io</b>.
</p>

<h3>Launch Tab</h3>
<p>
Shows the complete server launch command built from all current settings.
The preview updates live whenever any setting changes.
<code>InsurgencyServer.exe</code> in the preview is replaced with the full exe path at launch time.<br>
<b>Auto-launch on startup:</b> When enabled and saved to config, the launcher will prompt
"Launch server now?" the next time it opens.<br>
Click <b>Launch Server</b> to start. Requires exe path, gamemode, and map to be set.
</p>

<h3>Resources</h3>
<p>
<a href="https://mod.io/g/insurgencysandstorm/r/server-admin-guide">Server Admin Guide</a> - Official NWI guide for hosting a dedicated server.<br>
<a href="https://www.youtube.com/watch?v=zeVC99ZqqTg">Official Video Guide</a> - Step-by-step video walkthrough for server setup.
</p>

<h3>Troubleshooting</h3>

<p><b>Server not loading mods</b><br>
Make sure you have a ModIO OAuth Access Token and user info in your <code>Engine.ini</code>:<br>
<code>[/Script/ModKit.ModIOClient]</code><br>
<code>bHasUserAcceptedTerms=True</code><br>
<code>AccessToken=YOUR_ACCESS_TOKEN</code><br>
Also ensure <code>-Mods -ModDownloadTravelTo=MAP?SCENARIO</code> is in your launch command (enable it in the Mods tab).
Try subscribing to the mods on ModIO and linking your Steam account.
</p>

<p><b>Server launches Range instead of selected map</b><br>
Add <code>-MultiHome=YOUR.IP.ADDRESS</code> to your launch command via the Parse IP toggle in the Server tab.
Also verify your Map/Scenario value is correct and that the launch command syntax is valid.
</p>

<p><b>Map vote / cycle not working</b><br>
Ensure <code>-MapCycle=MapCycle.txt</code> is in the launch command (enable it in the Map Cycle tab).
Then add the following to <code>Game.ini</code>:<br>
<code>bMapVoting=True</code> - vote for next map after each round<br>
<code>bUseMapCycle=False</code> - automatically load the next map in the cycle<br>
Also verify your <code>MapCycle.txt</code> uses the correct format:<br>
<code>(Scenario="Scenario_Hideout_Checkpoint_Security",Lighting="Day")</code>
<code>(Scenario="Scenario_Hideout_Checkpoint_Insurgents",Lighting="Night")</code>
</p>

<p><b>Setting mods/gamemode manually</b><br>
If the custom input fields are not working, save your config and edit <code>launcher_config.json</code>
directly in a text editor. To use a fully modded map, set <code>map_value</code> to an empty string
and enter the scenario manually via the Custom map field in the Game tab.
</p>
"""


class HelpTab(QWidget):
    def __init__(self):
        super().__init__()
        self._build_ui()

    def _build_ui(self):
        layout = QVBoxLayout(self)
        browser = QTextBrowser()
        browser.setHtml(_HELP_HTML)
        browser.setOpenExternalLinks(True)
        layout.addWidget(browser)
