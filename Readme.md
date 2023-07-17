# Dotfiles

## Use

Define this function

```bash
dotfiles() {
  git -C / --git-dir="$PWD/.git" "$@"
}
```

To add files:

```bash
dotfiles add -f <file>
```

Use git normally with files in `conf`.

## Commit messages format

`action(app): message`

 - action:
  - config: Configuratios.
  - update: Update from upstream files in conf/sources.csv.
  - refactor: Changes in structure not affecting configuration.
 - app: awesomewm, gtk, xterm ...
 - message: text.

