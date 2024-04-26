HOW TO UNFUCK OSX

Unfuck Keyboard:
1) Set function keys as default instead of the stupid bullshit keys https://support.apple.com/en-us/102439
2) Use English ABC layout for english keyboard, all the others are fucked beyong repair
   - Use Karabiner - https://karabiner-elements.pqrs.org/ - to fix the backtick/tilde key to actually type backtick/tilde. For this download predefined rule "Remap section sign from British Keyboard to US's backtick + plusminus to tilde"
3) Install PC-Style shortcuts to Karabiner Elements: https://ke-complex-modifications.pqrs.org/?q=home%20end
   - You can then selectively enable/disable these modifications. It makes HOME/END do beginning/end of line, like a normal OS.

Unfuck Touchpad:
1) Enable "touch to click" so you won't have to push through the touchpad for every click: Apple logo in top left corner, system settings, trackpad, enable Tap to click.
2) Install https://github.com/artginzburg/MiddleClick-Sonoma to emulate middle-click with three (or more) fingers tap both on touchpad and Magic Mouse.

Unfuck mice:
1) There's a tool for that: https://github.com/ther0n/unnaturalscrollwheels - it allows:
  - Inverting horizontal/vertical scrolling
  - Disabling scroll acceleration
  - Disabling mouse acceleration

Turn off the fucked startup sound:
1) Click apple icon, System Settings, Sound, Play sound on Startup

Setup proper environment similar to Linux:
1) Install iTerm2
  - Configure the Iterm2 / Settings / General / Closing / Quit when all windows are closed. This will close the iTerm2 application so that when you close all the terminal windows, the application will no longer appear in the alt-tab menu option which does NOTHING when you pick it.
2) Install homebrew - follow the guide in here: https://brew.sh/
3) Install basic packages: brew install bash coreutils gsed mc
4) Set up your .bash_profile (check the file in this repo for inspiration or as a default). BEWARE, macos doesn't use .bashrc, you need to use .bash_profile
5) Set Bash from Homebrew as your default shell:
  - sudo sh -c 'echo /opt/homebrew/bin/bash >> /etc/shells'
  - chsh -s /opt/homebrew/bin/bash
6) Setup your gitconfig, i.e.
```.gitconfig
[user]
	email = personal@gmail.com
	name = My Name
[core]
	excludesfile = /Users/<username>/.gitignore_global
[includeIf "gitdir:/Users/<username>/git/work/"]
	path = /Users/<username>/.gitconfig-work
[includeIf "gitdir:/Users/<username>/git/personal/"]
	path = /Users/personal/.gitconfig-personal
[push]
	autoSetupRemote = true
```

```.gitconfig-work
[user]
	name = My Work Name
	email = myworkname@work.com
[core]
	sshCommand = ssh -i /Users/<username>/.ssh/id_ed25519_work -o IdentitiesOnly=yes
```

Some useful oneliners:
```
# Unhide Library folder
chflags nohidden "${HOME}/Library/"

# Set login message
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText 'your@email \u2022 +420-XXX-YYY-ZZZ'

# Expand Save dialog by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Save screenshots in PNG
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture location -string "${HOME}/Downloads"

# Delete unavailable simulators from XCode
xcrun simctl delete unavailable

function wifi_name {
        /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | \
            awk '/ SSID/ { print $2 }'
    }

alias ldd='otool -L'

alias lockscreen='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

alias plview='plutil -convert xml1 -o -'

alias ql='qlmanage -p'

alias sshot='screencapture -t png -ix ${HOME}/Downloads/sshot.png && ql ${HOME}/Downloads/sshot.png 2>/dev/null'

alias lsusb='system_profiler SPUSBDataType'
```
