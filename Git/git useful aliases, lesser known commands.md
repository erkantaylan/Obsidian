#git 

[[https://hackernoon.com/lesser-known-git-commands-151a1918a60]]

## Short Status
```bash
git config --global alias.st 'status --short --branch'
```

## Merge --no-ff

```bash
git config --global alias.merc 'merge --no-ff'
```

## Git log graphical

```bash
git config --global alias.grog 'log --graph --abbrev-commit --decorate --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)"'
```