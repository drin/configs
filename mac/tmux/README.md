# Overview

This directory is for all of my tmux configuration, since I want to actually setup my terminal the
way I want it now. Mainly, I am making this README to note where I got the tmux theme (even though
it is relatively self explanatory).

# Configuration

## TermInfo

Using some information from  [this stackexchange thread][web-tmuxtermcolors] and
[this section][web-alacrittytic] of an archlinux wiki page for Alacritty terminfo, I
created `alacritty.terminfo` and `alacritty.tmux.terminfo` on my mac environment using:

* For `alacritty.terminfo` (in Alacritty and not in a tmux):
  ```bash
  infocmp > alacritty.terminfo
  ```

* For `alacritty.tmux.terminfo` (in Alacritty and in a tmux):
  ```bash
  infocmp -x tmux-256color >  alacritty.tmux.terminfo
  printf '\tTc,\n'         >> alacritty.tmux.terminfo
  ```

To add information from a terminfo file into the terminfo database, run:
```bash
# you may replace `alacritty.tmux.terminfo` with another terminfo file
tic -x alacritty.tmux.terminfo
```


## [Nord Theme][theme-nord]

The nord theme is really nice, and makes the tmux status bar tolerable. Byobu's default style is
nice, but nord is next level.

Also, it turns out that most of the files from the repository are needed. So, I should setup an
installer to checkout the repository ([nord theme repo][repo-nordtheme]), but for now it can just
be manually setup.

<!-- resources -->
[theme-nord]:         https://www.nordtheme.com/docs/ports/tmux/installation

[repo-nordtheme]:     https://github.com/arcticicestudio/nord-tmux

[web-tmuxtermcolors]: https://unix.stackexchange.com/a/579927
[web-alacrittytic]:   https://wiki.archlinux.org/title/Alacritty#Terminal_functionality_unavailable_in_remote_shells
