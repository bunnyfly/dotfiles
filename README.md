Dotfiles by Chloe Adeline
=========================
My personal setup! Probably not useful to most, but you might find some useful stuff in here, especially if you use Colemak and Vim!

Colemak and Vim!
----------------
I have intuitive and concise mappings to reconcile Colemak and Vim with traditional homerow arrows.

All my tools [less, tmux, etc] are configured consistently in this Vim style. I've been using this since 2008 and haven't looked back!

In a nutshell: keep Qwerty HJKL-style homerow arrows and change as little else as possible.

`HNEI` homerow arrows mean that `JKL` are free to use and `NEI` need new keys.
- `k`/`K` is the new `n`/`N`.
- `s`/`S` is the new `i`/`I` ["inSert"]. The default `s`/`S` is synonymous with `cl`/`cc` and is not very useful.
- `l`/`L` skips to beginning and end of lines. Much more intuitive and easy than `^` and `$`.
- `j`/`J` is the new `e`/`E` ["Jump" to EOW].
- See `vimrc` for a few other details...

Tools
-----
Includes customization for:
- [zsh](http://www.zsh.org/) - shell flavored with [prezto](https://github.com/sorin-ionescu/prezto)
- [tmux](http://tmux.sourceforge.net/) - session management and shell multiplexing
- [vim](http://www.vim.org/) - text editing
- [git](http://git-scm.com/) - version control
- [pentadactyl](http://5digits.org/pentadactyl/) - Firefox Vim-inspired browsing
- [powerline](https://github.com/Lokaltog/powerline) - statusline and prompt for vim, tmux, zsh, and others
- [less](http://www.greenwoodsoftware.com/less/) - pager and file viewer

Setup
-----
- Clone into `~/dotfiles`
- `./install_dotfiles.sh`
- Vim `:BundleInstall` to install Vim plugins
...and probably some other steps like installing Powerline-enabled fonts. But that's most of it.
