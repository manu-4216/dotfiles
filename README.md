# Dotfiles

These config files can be useful to share configurations across machines.
They are usually stored in the home directory (`~`).

## How to load these files

This can be done by creating a symbolic link. For instance, for `.vimrc`:

```bash
ln -s <this-repo-location>/.vimrc ~/.vimrc
```

Or with the simple `load.sh` script:

```bash
./load.sh .vimrc
```
