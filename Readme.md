# Dotfiles

## Usage

Define this function:

```bash
dotfiles() {
  git -C / --git-dir="$PWD/.git" "$@"
}
```

To install switch to a branch (`git switch blue`) and run commands in `conf/Install.md`.

To update pull new changes, run new commands in `conf/Install.md` and copy changes in configuration files (run rest with sudo to copy changes in files not in home directory).

```bash
git pull
dotfiles reset --hard
```

To commit files:

```bash
dotfiles add -f <file>
dotfiles commit
```

Use git normally with files in `conf` folder.

## Commit messages format

`action(app): message`

- action:
  - config: Configuratios.
  - update: Update from upstream files in `conf/sources.csv`.
  - refactor: Changes in structure not affecting configuration.
- app: awesomewm, gtk, xterm ...
- message: text.

