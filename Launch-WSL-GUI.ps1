$XServerConfig = "C:\Users\smuise\config.xlaunch"
$WSLAHKScript = "C:\Users\smuise\WSL.ahk"
$WSLExec = "C:\Windows\system32\wsl.exe"
$WSLArgs = "genie -c /home/smuise/startBspwm.sh"

Start-Process $XServerConfig
Start-Process $WSLAHKScript
Start-Process $WSLExec $WSLArgs
