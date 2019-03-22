tell application "Tunnelblick"
    connect "Airtrip"
    delay 0.05
    tell application "System Events"
        set totp to do shell script "~/.pyenv/shims/python2 ~/.dotfiles/scripts/totp_pw.py"
        keystroke totp
        keystroke return
    end tell
    get state of first configuration where name = "Airtrip"
    repeat until result = "CONNECTED"
        delay 0.2
        get state of first configuration where name = "Airtrip"
    end repeat
end tell
