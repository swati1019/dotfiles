# Arch Linux Dotfiles

A self-managing Linux environment designed for unattended operation — 
built with embedded systems in mind.

## Setup
- OS: Arch Linux (ARM64)
- Shell: Bash
- Editor: Vim
- WM: i3 (tiling window manager)
- Hardware: Apple M3 (UTM VM)

## Quick Install
On any fresh Arch Linux system:
```bash
git clone https://github.com/swati1019/dotfiles.git
cd dotfiles
./install.sh
```

## Structure
- `scripts/` — automation shell scripts
- `i3/` — i3 window manager config
- `i3status/` — status bar config
- `projects/` — C programs reading Linux kernel interfaces
- `.vimrc` — vim configuration
- `install.sh` — one command full setup
- `crontab.bak` — scheduled automation tasks

## Scripts
| Script | Purpose | Schedule |
|--------|---------|----------|
| system-monitor.sh | Live CPU, RAM, disk stats | Every minute |
| log-cleaner.sh | Archives logs older than 3 days | 2AM daily |
| backup.sh | rsync backup of home directory | 3AM daily |
| watchdog.sh | Auto-restarts crashed processes | On boot, always running |

## Projects
| File | Description |
|------|-------------|
| sysmon.c | Reads /proc/stat and /proc/meminfo directly from Linux kernel to compute live CPU and RAM usage |

## Design Philosophy
Built around embedded Linux principles:
- Boot-time automation via cron @reboot
- Crash recovery via process watchdog
- Storage management via log rotation
- Data protection via incremental rsync backup
- Fully reproducible via single install.sh script
