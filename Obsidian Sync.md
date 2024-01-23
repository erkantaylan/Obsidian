Download termux to Android
Install the following base packages from command line:

```
pkg install git openssh
```

Enable access to share storage within Termux by running:

```
termux-setup-storage

```

Create **Git global config** on your phone:

```
git config — global user.name 'John Doe'  
git config — global user.email '[johndoe@example.com](mailto:johndoe@example.com)'
```

Before cloning your repo, **setup your SSH key**:

```
touch ~/.ssh/authorized_keys  
chmod 600 ~/.ssh/authorized_keys  
chmod 700 ~/.ssh  
ssh-keygen  
ssh-keygen -t ed25519 -C "your_email@example.com"
chmod 600 ~/.ssh/authorized_keys  
sshd
cat ~/.ssh/id_ed25519.pub
```

If it gives error at `ssh-keygen` run `pkg up` https://github.com/termux/termux-packages/issues/15155#issuecomment-1427518342

[termux and git installation](https://medium.com/tech-notes-and-geek-stuff/git-management-on-android-30a8b4a23e1c)

Rest is go to github/gitlub/bitbucket add your .pub key to server and start cloningP