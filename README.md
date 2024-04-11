HOW TO UNFUCK OSX

Unfuck Keyboard:
1) Set function keys as default instead of the stupid bullshit keys https://support.apple.com/en-us/102439
2) Use English ABC layout for english keyboard, all the others are fucked beyong repair
   - Use Karabiner - https://karabiner-elements.pqrs.org/ - to fix the backtick/tilde key to actually type backtick/tilde. For this download predefined rule "Remap section sign from British Keyboard to US's backtick + plusminus to tilde"


Unfuck Touchpad:
1) Enable "touch to click" so you won't have to push through the touchpad for every click: Apple logo in top left corner, system settings, trackpad, enable Tap to click


Setup proper environment similar to Linux:
1) Install iTerm2
2) Install homebrew - follow the guide in here: https://brew.sh/
3) Install basic packages: brew install bash coreutils gsed mc
4) Set up your .bash_profile (check the file in this repo for inspiration or as a default). BEWARE, macos doesn't use .bashrc, you need to use .bash_profile
5) Set Bash from Homebrew as your default shell:
  - sudo sh -c 'echo /opt/homebrew/bin/bash >> /etc/shells'
  - chsh -s /opt/homebrew/bin/bash
6) Setup your gitconfig, i.e.
```.gitconfig
[user]
	email = stefan.safar@nbcuni.com
	name = Stefan Safar
[core]
	excludesfile = /Users/ssr80/.gitignore_global
[includeIf "gitdir:/Users/ssr80/git/sky/"]
	path = /Users/ssr80/.gitconfig-sky
[includeIf "gitdir:/Users/ssr80/git/nbcu/"]
	path = /Users/ssr80/.gitconfig-nbcu
[push]
	autoSetupRemote = true
```

```.gitconfig-sky
[user]
	name = Stefan Safar
	email = stefan.safar@sky.uk
[core]
	sshCommand = ssh -i /Users/ssr80/.ssh/id_ed25519_sky_git -o IdentitiesOnly=yes
```
