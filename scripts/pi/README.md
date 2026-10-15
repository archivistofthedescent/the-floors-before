# Daily release from a Raspberry Pi

The Pi publishes one queued chapter a day. Everything lives on the external HDD, not the SD card.

## How it works

- Finished chapters wait in `queue/`, named so they sort in release order (`001-...md`, `002-...md`).
- Once a day, `release-next.sh` moves the first one into `_chapters/` and pushes.
- GitHub Pages rebuilds the site automatically. An empty queue means nothing happens.

## One-time setup on the Pi

1. Find the HDD and check free space: `lsblk` and `df -h`. The examples assume it's mounted at `/mnt/hdd`.
   Make sure it mounts at boot (an entry in `/etc/fstab`), otherwise the script stops safely.
2. Make a key the Pi will use to push:
   `ssh-keygen -t ed25519 -f ~/.ssh/floors_deploy -N ""`
   Then, in the GitHub repo, add the contents of `~/.ssh/floors_deploy.pub` under
   Settings → Deploy keys, and tick **Allow write access**.
3. Tell SSH to use it. Add this to `~/.ssh/config`:
   ```
   Host github.com
     IdentityFile ~/.ssh/floors_deploy
   ```
4. Clone onto the HDD and set the commit name:
   ```
   git clone git@github.com:archivistofthedescent/the-floors-before.git /mnt/hdd/the-floors-before
   cd /mnt/hdd/the-floors-before
   git config user.name "Archivist of the Descent"
   git config user.email "archivistofthedescent@users.noreply.github.com"
   ```
5. Test once by hand: `/mnt/hdd/the-floors-before/scripts/pi/release-next.sh`
6. Schedule it daily at 9am with `crontab -e`, adding:
   ```
   0 9 * * * /mnt/hdd/the-floors-before/scripts/pi/release-next.sh >> /mnt/hdd/floors-release.log 2>&1
   ```

## Optional: Claude writes the next part every night

`draft-next.sh` runs Claude Code on the Pi. Claude writes the next part following `STYLE.md` and opens a pull request. You read it on your phone and merge it if you like it. The next morning, `release-next.sh` publishes it.

Setup:
1. Check the Pi is 64-bit: `uname -m` must print `aarch64`.
2. Install Claude Code (see the official install instructions at docs.claude.com), then run `claude` once and sign in.
3. Install the GitHub CLI (`sudo apt install gh`) and run `gh auth login` as the `archivistofthedescent` account.
4. Test once by hand: `/mnt/hdd/the-floors-before/scripts/pi/draft-next.sh`
5. Add a nightly run with `crontab -e`, at 2am:
   ```
   0 2 * * * /mnt/hdd/the-floors-before/scripts/pi/draft-next.sh >> /mnt/hdd/floors-draft.log 2>&1
   ```
   Cron has a minimal PATH. If `claude` or `gh` isn't found, add a `PATH=...` line at the top of the crontab using the output of `echo $PATH`.
