# Dotfiles

## Usage

There is a branch for each host, this repo uses yadm.

```bash
yadm clone -w / -b blue git@github.com:Gonzalocl/dotfiles.git
```

To update system files:

```
yadm reset
sudo yadm --yadm-repo /home/gonzalo/.local/share/yadm/repo.git checkout /
sudo yadm --yadm-repo /home/gonzalo/.local/share/yadm/repo.git merge origin/blue
sudo chown -R gonzalo:gonzalo /home/gonzalo/.local/share/yadm/repo.git/
```

## Commit format

`action(app): message`

- action:
  - config: Configuratios.
  - update: Update from upstream files in `conf/sources.csv`.
  - refactor: Changes in structure not affecting configuration.
- app: awesomewm, gtk, xterm ...
- message: text.

