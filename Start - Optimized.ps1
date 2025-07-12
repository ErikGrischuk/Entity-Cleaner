# --- Server identity ---
$serverdir = "Tranquility"
$cfgPath = ".\server\$serverdir\cfg\server.cfg"
if (-not (Test-Path $cfgPath)) {
    New-Item -ItemType File -Path $cfgPath -Force | Out-Null
}

# --- Server configuration ---
$ip            = "192.168.137.1"
$port          = 28015
$rconport      = 28016
$queryport     = 28017
$appport       = 28083
$rconpassword  = "MyStrongPassword123"
$rconweb       = $true
$servername    = "[US] Tranquility:PvE"
$gamemode      = "survival"
$tags          = "monthly,pve,vanilla,na"
$serverurl     = "https://example.png"
$headerimage   = "https://example.png"
$logoimage     = "https://example.png"
$serverlevel   = "Procedural Map"
$worldsize     = 1000
$seed          = 123456
$salt          = 654321
$saveinterval  = 600
$tickrate      = 128
$fps           = 256
$gamelog       = "server.log"
$maxplayers    = 50
$systemcpupriority = "high"
$clanenabled   = $true
$serverofficial = $true
$tutorialenabled = $true
$ServerPve     = $false

# --- Arguments ---
$arguments = @(
    "-batchmode"
    "-nographics"
    "-logfile", $gamelog
    "-logfilelevel", "info"
    "+server.identity", $serverdir
    "+server.readcfg"
    "+server.ip", $ip
    "+server.port", $port
    "+server.queryport", $queryport
    "+app.listenip", $ip
    "+app.publicip", $ip
    "+app.port", $appport
    "+rcon.ip", $ip
    "+rcon.port", $rconport
    "+rcon.web", $rconweb
    "+rcon.password", "`"$rconpassword`""
    "+server.hostname", "`"$servername`""
    "+server.gamemode", $gamemode
    "+server.tags", $tags
    "+server.url", "`"$serverurl`""
    "+server.headerimage", "`"$headerimage`""
    "+server.logoimage", "`"$logoimage`""
    "+clan.enabled", $clanenabled
    "+server.official", $serverofficial
    "+server.tutorialenabled", $tutorialenabled
    "+server.pve", $ServerPve
    "+server.level", "`"$serverlevel`""
    "+server.worldsize", $worldsize
    "+server.seed", $seed
    "+server.salt", $salt
    "+server.saveinterval", $saveinterval
    "+server.tickrate", $tickrate
    "+fps.limit", $fps
    "+server.maxplayers", $maxplayers
    "+system.cpu_priority", $systemcpupriority
)

# --- Run server ---
Start-Process ".\RustDedicated.exe" -ArgumentList $arguments
