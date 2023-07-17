# Dotfiles

## Usage

Define this function:

```bash
dotfiles() {
  git -C / --git-dir="$PWD/.git" "$@"
}
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
  - update: Update from upstream files in conf/sources.csv.
  - refactor: Changes in structure not affecting configuration.
- app: awesomewm, gtk, xterm ...
- message: text.

