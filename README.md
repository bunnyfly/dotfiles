Dotfiles by Chloe Adeline
=========================
My personal setup and notes for myself! Probably not useful to most, but you might find some useful
stuff in here, especially if you use Colemak and Vim!

Colemak and Vim!
----------------
I have intuitive and concise mappings to reconcile Colemak and Vim with traditional homerow arrows.
All my tools [less, tmux, etc] are configured consistently in this Vim style. I've been using this
since 2008 and haven't looked back!

The idea is to use `HNEI` as arrows – keeping the traditional Vim homerow style – and changing as
little else as possible. This means `JKL` are free to use and `NEI` need new keys.
- `k`/`K` is the new `n`/`N`.
- `s`/`S` is the new `i`/`I` ["inSert"].
- `j`/`J` is the new `e`/`E` ["Jump" to EOW].
- `l`/`L` skip to the beginning and end of lines. Much more intuitive than `^`/`$`.
- `Ctrl-L` joins lines, making `L` the veritable "Line" key.
- `r` replaces `i` as the "inneR" modifier [e.g. `diw` becomes `drw`].
- That's most of it! See .vimrc for a few other details...

Tools
-----
Includes customization for:
- [zsh](http://www.zsh.org/) - shell flavored with [prezto](https://github.com/sorin-ionescu/prezto)
- [tmux](http://tmux.sourceforge.net/) - session management and shell multiplexing
- [vim](http://www.vim.org/) - text editing
- [git](http://git-scm.com/) - version control
- [pentadactyl](http://5digits.org/pentadactyl/) - Firefox Vim-inspired browsing
- [powerline](https://github.com/Lokaltog/powerline) - statusline and prompt for vim, tmux, zsh, and
  others
- [less](http://www.greenwoodsoftware.com/less/) - pager and file viewer

Setup
-----
Again...notes for myself.
- Clone into `~/dotfiles`
- `./install_dotfiles.sh`
- Vim `:BundleInstall` to install Vim plugins
- Fill in .\<program>rc-local configs.

...and probably some other steps like installing Powerline-enabled fonts. But that's most of it.
