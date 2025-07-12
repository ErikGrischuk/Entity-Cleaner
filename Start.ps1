# --- Server identity ---
# The server identity is used to store server data, such as player profiles, world state, and other settings.
$serverdir = "Tranquility"                     
# DefaultValue: "my_server_identity"
# You can change this name to anything you like, but it must be unique for each server instance.
# The server identity name is used to create a folder in the server directory where the server data will be stored.
# Ensure server.cfg exists in .\server\$serverdir\cfg\
$cfgPath = ".\server\$serverdir\cfg\server.cfg"
if (-not (Test-Path $cfgPath)) {
    New-Item -ItemType File -Path $cfgPath -Force | Out-Null
}

# --- IP server ---
# IP for server connection
# You can find your IP address by running `ipconfig` in cmd.exe or PowerShell
# Use 127.0.0.1 for local testing
# If you want to run the server on a local network, you can use your local IP address (e.g., "192.168.1.100")
# If you want to run the server on a public network, you can use your public static IP address (e.g., "203.0.113.1")
$ip = "192.168.137.1"                               # IP address server         | DefaultValue: "127.0.0.1"  | IP address for game server. This IP address is used for the game client to connect to the server.

# --- Ports ---
# Ports for server connection
# You can change the ports if they are already in use or if you want to use custom ports.
# The default ports are used for the game server, RCON, and Steam queries.
# You need to open these ports in your firewall and router settings for the server to be accessible from the internet.
# Windows Defender Firewall will automatically open the ports for the server when you run it for the first time.
# If you want to use different ports, you can change them in the variables below.
$port = "28015"                                     # Port for game server      | DefaultValue: "28015" "UDP"| Game server port for game client connection. This port is used for the game client to connect to the server.
$rconport = "28016"                                 # Port for RCON             | DefaultValue: "28016" "TCP"| RCON port for game server. This port is used for the game client to connect to the server.
$queryport = "28017"                                # Port for Steam queries    | DefaultValue: "28017" "UDP"| Steam query port for game server. This port is used for the game client to connect to the server.
$appport = "28083"                                  # Port for application      | DefaultValue: "28083" "TCP"| Application RUST+ port for game server. This port is used for the game client to connect to the server.

# --- RCON settings ---
# It is recommended to use a strong password with at least 12 characters, including uppercase and lowercase letters, numbers, and special characters.
# RCON (Remote Console) is a protocol that allows you to remotely control the server using commands.
# You can use RCON to manage the server, execute commands, and monitor the server status
# You can use RCON clients such as RustAdmin, Rusty, or any other RCON client that supports the RCON protocol.
$rconpassword = "MyStrongPassword123"               # RCON password. RCON password for game server. This password is used for the game client to connect to the server.
$rconweb = "True"                                   # Enable RCON web interface. Enable RCON web interface for game server. This allows you to manage the server using a web interface.

# --- Server settings ---
# The server settings are used to configure the server name, game mode, tags, and other settings.
# The server name is displayed in the server list and in the game client.
$servername = "[US] Tranquility:PvE"                # Server Hostname. The server hostname is used to display the server name in the server list and in the game client.   
$gamemode = "survival"                                      # Game mode (e.g., "vanilla", "survival", "softcore", "hardcore", "weapontest", "primitive") If left empty, the default mode (vanilla) will be used. More info: https://wiki.facepunch.com/rust/server-gamemodes
$tags = "monthly,pve,vanilla,na"                    # Server tags (e.g., "monthly,pve,vanilla,na") - tags must be comma-separated. More info: https://wiki.facepunch.com/rust/server-browser-tags
$serverurl = "https://example.png"                  # Server URL used to display server information in the server list
$headerimage = "https://example.png"                # URL of the server header image. The header image size is 1920x1080 pixels
$logoimage = "https://example.png"                  # URL of the server logo image. The logo image size is 256x256 pixels

# --- World generation settings ---
# Procedural Map generation settings
$serverlevel = "Procedural Map"                     # Server level (e.g., "Procedural Map", "Hapis Island", "Savas Island")
$worldsize = "1000"                                 # The larger the map, the more disk space and memory you need. Use 1000 to 6000 for large maps. The default value is 1000, which is suitable for most servers. The world size is measured in meters, so a world size of 1000 means a map size of 1000x1000 meters.
$seed = "123456"                                    # Sets the random seed for how the map is generated. This number can be any value 0-2147483647
$salt = "654321"                                    # Salt value for world generation; affects resource spawn locations.

# --- Performance settings ---
# These settings affect the server performance and stability. It is recommended to use the default values unless you know what you are doing.
# The server will automatically save the world state at the specified interval.
$saveinterval = "600"                               # World save interval defaultValue: "600" - in seconds (e.g., "600" - 10 minutes)
$tickrate = "128"                                   # Server tick rate          | defaultValue: "10"   | - affects server performance
$fps = "256"                                        # Frames per second (FPS)   | defaultValue: "256"  | - affects server performance
$gamelog = "server.log"                             # Log file (e.g., "server.log") - will be created in the server launch directory
$maxplayers = "50"                                  # Maximum number of players on the server
$systemcpupriority = "high"                         # CPU priority for the server process. Possible values: below_normal, normal, above_normal, high

#--- TEST SETTINGS ---
#--- Clan system settings ---
# This is a test setting to enable the clan system.
# These settings are used for testing purposes and can be changed as needed.
# WARNING: Enabling the clan system may reset the server identity folder and save files.
# IF server before created, SERVER AUTOMATICALLY will DELETE the save files to apply the changes.
# Enables the clan system if set to true (must be set at boot, requires restart)
# The clan system allows players to create and join clans (use table clan)
# which can provide benefits such as shared resources and protection.
$clanenabled = "True"

# --- Official server settings ---
# WARNING: If you set it to True without permission from Facepunch, your server may be completely removed from the Community/Modded server lists.
# WARNING: It does not make your server official, even if you set it to True. But if you try to enable it, you risk getting banned from the server list.
# After setting this value to True, the server will NOT be marked as an official server in the server list.
# Use this setting only if you need support for official server features.
# This setting for features such as Steam Achievements, Tasks for new players or other features that are available only on official servers.
$serverofficial = "True"

# --- Tutorial island settings ---
# ConVar 'tutorialenabled' will be replicated to all other players on the server
# This setting enables the tutorial island on the server.
# The tutorial island is a special map that provides a safe environment for new players to learn the game mechanics.
# If you want to enable the tutorial island, set this value to True.
$tutorialenabled = "True"

# --- Server PVE settings ---
# PVE mode allows players to play together without the risk of being attacked by other players.
# WARNING: If you set this value to True, the server will automatically delete all player data
# Broken for normal gameplay, please use plugin TruePVE by Wulf - https://umod.org/plugins/true-pve)
$ServerPve = "False"


# --- Arguments ---
# The arguments are used to launch the server with the specified settings.
# You can add or remove arguments as needed.
# The arguments are passed to the RustDedicated.exe executable when the server is started.
# For String arguments use double quotes (") to enclose the value, and use backticks (`) to escape double quotes inside the string.
# For example: "+server.hostname `"My Server`""
# For numeric arguments, you can use the value directly without quotes.
# For example: "+server.maxplayers 50"
$arguments = @(
# --- Process launch parameters ---
    "-batchmode",                                    # Run in batch mode (without GUI)
#    "-load",                                         # Force load HarmonyMods plugins
    "-nographics",                                   # Run without GUI
    "-logfile", "$gamelog",                          # Log file
    "-logfilelevel info",                            # Log file level
# --- Server configuration ---
    "+server.identity $serverdir",                   # Server identity name
    "+server.readcfg"                                # Read server.cfg
# --- Connection parameters ---
    "+server.ip $ip",                                # Server IP
    "+server.port $port",                            # Server Port
    "+server.queryport $queryport",                  # Port Steam API
# --- Rust+ App parameters ---
    "+app.listenip $ip",                             # Rust+ App IP 
    "+app.publicip $ip",                             # Rust+ App Public IP
    "+app.port $appport",                            # Rust+ App Port
# --- RCON parameters ---
    "+rcon.ip $ip",                                  # RCON IP
    "+rcon.port $rconport",                          # RCON Port
    "+rcon.web $rconweb",                            # RCON Web
    "+rcon.password `"$rconpassword`"",              # RCON password
# --- Server settings ---
    "+server.hostname `"$servername`"",              # Server Hostname
    "+server.gamemode $gamemode",                    # Server gamemode
    "+server.tags $tags",                            # Server tags
    "+server.url `"$serverurl`"",                    # Server URL
    "+server.headerimage `"$headerimage`"",          # Header image
    "+server.logoimage `"$logoimage`"",              # Logo image
# --- Test server settings ---
    "+clan.enabled $clanenabled",                    # Enable clan system
    "+server.official $serverofficial",              # Enable official server features 
    "+server.tutorialenabled $tutorialenabled",      # Enable tutorial island on server (server tag: tut)
    "+server.pve $ServerPve",                        # Enable PVE mode on server
# --- World generation settings ---
    "+server.level `"$serverlevel`"",                # Server level
    "+server.worldsize $worldsize",                  # World size
    "+server.seed $seed",                            # Server seed
    "+server.salt $salt",                            # Server salt
# --- Performance settings ---
    "+server.saveinterval $saveinterval",            # World save interval
    "+server.tickrate $tickrate",                    # Server tick rate
    "+fps.limit $fps",                               # Server FPS
    "+server.maxplayers $maxplayers",                # Max Players
    "+system.cpu_priority $systemcpupriority"        # CPU priority for server process
)
# --- Run server ---
Start-Process ".\RustDedicated.exe" -ArgumentList $arguments