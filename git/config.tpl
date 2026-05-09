[user]
  email = matty_cforth@outlook.com
  name = Matthew Forth
  signingkey = op://Personal/Github Signing Key/public key 

[gpg]
  format = ssh

[gpg "ssh"]
  program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"

[commit]
  gpgsign = true

[pull]
	rebase = false
[push]
	autoSetupRemote = true
[core]
	excludesFile = ~/.config/git/ignore
[diff]
	algorithm = histogram
	colorMoved = plain
	mnemonicPrefix = true
	renames = true
