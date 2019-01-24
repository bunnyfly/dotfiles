""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initialization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" Plugins!
  filetype off
  call plug#begin('~/.vim/plugged')
" Plugins - UI
  Plug 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air.
  Plug 'vim-airline/vim-airline-themes' " A collection of themes for vim-airline.
  " Plug 'airblade/vim-gitgutter' " git diff in the gutter (sign column) and stages/undoes hunks
" Plugins - Navigation
  Plug 'scrooloose/nerdtree' " A tree explorer plugin for vim.
  " Plug 'majutsushi/tagbar' " Displays tags in a window, ordered by scope.
  " Install FZF via vim (vs referencing existing install) to avoid out of sync version issues.
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
" Plugins - Editing
  Plug 'tpope/vim-abolish' " easily search for, substitute, & abbreviate multiple variants of a word
  Plug 'tpope/vim-commentary' " comment stuff out
  Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with .
  Plug 'tpope/vim-surround' " quoting/parenthesizing made simple.
  Plug 'easymotion/vim-easymotion' " Vim motion on speed!
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  " Plug 'SirVer/ultisnips' " UltiSnips - The ultimate snippet solution for Vim
  " Plug 'honza/vim-snippets' " UltiSnips snippets (originally vim-snipmate)
" Plugins - Languages
  Plug 'pangloss/vim-javascript' " syntax highlighting and improved indentation
  Plug 'leafgarland/typescript-vim' " Typescript syntax files for Vim.
  " Plug 'fatih/vim-go' " Go development plugin for Vim.
" Wrap up plugins!
  call plug#end()
  filetype plugin indent on

" Machine specific settings if they exist.
silent! source ~/.vimrc-local

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colemak-Vim Mappings
"
" The idea is to use HNEI as arrows – keeping the traditional Vim homerow style – and changing as
" little else as possible. This means JKL are free to use and NEI need new keys.
" - k/K is the new n/N.
" - s/S is the new i/I ["inSert"].
" - j/J is the new e/E ["Jump" to EOW].
" - l/L skip to the beginning and end of lines. Much more intuitive than ^/$.
" - Ctrl-l joins lines, making l/L the veritable "Line" key.
" - r replaces i as the "inneR" modifier [e.g. "diw" becomes "drw"].
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HNEI arrows. Swap 'gn'/'ge' and 'n'/'e'.
  noremap n gj|noremap e gk|noremap i l|noremap gn j|noremap ge k
" In(s)ert. The default s/S is synonymous with cl/cc and is not very useful.
  noremap s i|noremap S I
" Repeat search.
  noremap k n|noremap K N
" BOL/EOL/Join.
  noremap l ^|noremap L $|noremap <C-l> J
" _r_ = inneR text objects.
  onoremap r i
" EOW.
  noremap j e|noremap J E


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Colemak Arrow-Based Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch tabs with Ctrl.
  nnoremap <C-i> <C-PageDown>|nnoremap <C-h> <C-PageUp>
" Switch panes with Shift.
  noremap H <C-w>h|noremap I <C-w>l|noremap N <C-w>j|noremap E <C-w>k
" Moving windows around.
  noremap <C-w>N <C-w>J|noremap <C-w>E <C-w>K|noremap <C-w>I <C-w>L
" High/Low/Mid.
  noremap <C-e> H|noremap <C-n> L|noremap <C-m> M
" Scroll up/down.
  noremap zn <C-y>|noremap ze <C-e>
" Back and forth in jump and changelist.
  nnoremap gh <C-o>|nnoremap gi <C-i>|nnoremap gH g;|nnoremap gI g,

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The best!
  noremap ; :
" Sane redo.
  noremap U <C-r>
" Y consistent with C and D
  noremap Y y$
" +/- increment and decrement.
  nnoremap + <C-a>|nnoremap - <C-x>
" Jump to exact mark location with ' instead of line.
  noremap ' `|noremap ` '
" zT/zB is like zt/zb, but scrolls to the top/bottom quarter of the screen.
  nnoremap <expr> zT 'zt' . winheight(0)/4 . '<C-y>'
  nnoremap <expr> zB 'zb' . winheight(0)/4 . '<C-e>'
" Auto-bracket.
  inoremap {<CR> {<CR>}<Esc>O
" Switch between most recent buffer with backspace
  nnoremap <BS> <C-^>
" Disable bad habits. Unfortunately, <C-m> == <CR>, so Mid is M until my fingers forget <CR>.
  "nnoremap <CR> <Nop>|nnoremap <Space> <Nop>|nnoremap <Del> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Mappings
"
" Plugin-specific mappings are set in the plugin's section.
"
" Reserved leader prefix conventions:
"   <Leader><Leader> (NERDTree)
"   <Leader>t_ (Tagbar)
"   <Leader>d_ (Diff Tools)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" Diff
  " Toggle diff on current window
  nnoremap <silent> <Leader>dd :call DiffToggle()<CR>
    function! DiffToggle()
      if &diff
        diffoff
      else
        diffthis
      endif
    :endfunction
  " Search for merge-conflicts
  nnoremap <silent> <Leader>d/ /<<<<<<<\\|=======\\|>>>>>>><CR>
" Text width
  " Toggle textwidth between 80, 100, and off.
  nnoremap <silent> <Leader>tw :call TextwidthToggle()<CR>
    function! TextwidthToggle()
      if &textwidth == 80
        set textwidth=100
      elseif &textwidth == 100
        set textwidth=0
      else
        set textwidth=80
      endif
    :endfunction
" Toggle paste mode.
  nnoremap <Leader>v :set invpaste<CR>:set paste?<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Display.
  set t_Co=256                         " 256 Colors.
  set shortmess+=I                     " Hide splash screen.
  set display+=lastline                " Show partial lines.
  set showtabline=1                    " Show tabs only when multiple tabs are open.
  set laststatus=2                     " Always show status bar.
  set statusline=%<%t%h%m%r%h%w%y\ %L\,\ Col\ %-3v\ %P
  set updatetime=100                   " Reduce swap-writing update time (better for vim-gitgutter)
" Text Display.
  syntax on                            " Syntax highlighting.
  set number                           " Show line numbers.
  set textwidth=100                    " Max line width.
  set colorcolumn=+1                   " Vertical line at textwidth.
  set guicursor+=a:blinkon0            " Turn cursor blinking off.
  set hlsearch                         " Search highlighting.
  set wrap                             " Wrapping on.
  set lbr                              " Wrap at word.
  set showbreak=···\                   " Line break indicator.
" Two-space tabs.
  set expandtab                        " Use spaces.
  set tabstop=2|set softtabstop=2      " Tabs = 2 spaces.
  set shiftwidth=2                     " Indentation (<< and >>) = 2 spaces.
" Editing.
  set autoindent                       " Keep line indentation.
  set whichwrap+=<,>,h,l,b,s,[,]       " Backspace and arrows can wrap to previous/next line.
  set splitbelow|set splitright        " Open new splits below and to the right.
" Searching and matching.
  set nowrapscan                       " Don't wrap search to beginning of file.
  set incsearch                        " Incremental searching.
  set ignorecase|set smartcase         " Ignore case when only lowercase letters are used.
                                       " Force matching with \c (ignore) or \C (match).
  set gdefault                         " Substitute all matches in a line (i.e. :s///g) by default.
  set showmatch                        " When a bracket is interted, flash the matching one.
" System.
  filetype plugin indent on            " Load filetype plugin and indent files.
  set mouse=a                          " Enable the mouse in all possible modes.
  set history=1000                     " Keep 1000 lines of command line history.
  set confirm                          " Confirm quit/save/etc.
  set wildmenu                         " Tab completion on.
  set wildmode=longest,full            " Tab complete longest common string, then each full match.
  if has("gui_macvim")
    set guioptions=egm
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14
  endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abolish
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  nmap <Leader>c <Plug>Coerce


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Disable default mappings.
  let g:EasyMotion_do_mapping = 0
  " Sane casing.
  let g:EasyMotion_smartcase = 1
  " Show jump keys in uppercase for legibility. (Can still type lower.)
  " let g:EasyMotion_use_upper = 1
  " Use Colemak homerow for jumps.
  let g:EasyMotion_keys = 'tsradeiohngpfwqjluy'
  nnoremap <Space> <Plug>(easymotion-t2)
  nnoremap <S-Space> <Plug>(easymotion-F2)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Don't add vim-gitgutter key mappings.
  let g:gitgutter_map_keys = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUndo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:gundo_right=1
  let g:gundo_preview_bottom=0
  let g:gundo_close_on_revert=1
  let g:gundo_map_move_older="n"
  let g:gundo_map_move_newer="e"
  let g:gundo_width=45
  let g:gundo_preview_height=10


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  nnoremap <silent> <Leader><Leader> :NERDTreeToggle<CR>
" Colemak
  let g:NERDTreeMapJumpFirstChild = "ge"
  let g:NERDTreeMapJumpLastChild = "gn"
  let g:NERDTreeMapToggleHidden = "H"
  let g:NERDTreeMapOpenSplit = "S"
  let g:NERDTreeMapOpenExpl = ""
" Options
  let g:NERDTreeWinSize = 50           " Default width.
  let g:NERDTreeQuitOnOpen = 0         " Stay open.
  let g:NERDTreeChDirMode = 2          " Vim's cwd follows NERDTree's cwd.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  nnoremap <silent> <Leader>tt :TagbarToggle<CR>
  nnoremap <silent> <Leader>tT :TagbarOpenAutoClose<CR>
  nnoremap <silent> <Leader>t<Space> :TagbarShowTag<CR>
" Options
  let g:tagbar_show_linenumbers = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Note: Needs to play nicely with YCM
  "let g:UltiSnipsExpandTrigger = "<Tab>"
  "let g:UltiSnipsListSnippets = "<S-tab>"
  "let g:UltiSnipsJumpForwardTrigger = "<C-i>"
  "let g:UltiSnipsJumpBackwardTrigger = "<C-h>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " FZF commands
  let g:fzf_command_prefix = 'Fzf'
  nnoremap <silent> <Leader>a :FzfAg<cr>
  nnoremap <silent> <Leader>f :FzfFiles<cr>
  nnoremap <silent> <Leader>h :FzfHelptags<cr>
  nnoremap <silent> <Leader>/ :FzfBLines<cr>
  nnoremap <silent> <Leader>: :FzfHistory:<cr>
  nnoremap <silent> <Leader>; :FzfHistory:<cr>

  " Extra key bindings
  " <C-n> (down), <C-e> (up), etc are mapped via $FZF_DEFAULT_OPTS.
  let g:fzf_action = {
    \ 'ctrl-h': 'topleft vsplit',
    \ 'ctrl-i': 'botright vsplit',
    \ 'H': 'aboveleft vsplit',
    \ 'N': 'belowright split',
    \ 'E': 'aboveleft split',
    \ 'I': 'belowright vsplit',
    \ 'T': 'tab split',
    \ }
  " Open FZF in tmux at bottom of screen.
  let g:fzf_layout = { 'down': '~50%' }
  " Disable statusline overwriting.
  let g:fzf_nvim_statusline = 0
  " [Buffers] Jump to the existing window if possible
  let g:fzf_buffers_jump = 1

  " Hide the statusbar in the FZF pane.
  augroup fzf
    autocmd!
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
  augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM - YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Note: Needs to play nicely with UltiSnips
  " let g:ycm_key_list_select_completion = ['<C-n>']
  " let g:ycm_key_list_previous_completion = ['<C-e>']
  " let g:ycm_key_invoke_completion = "<C-i>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors (Always at bottom of .vimrc)
"
" Good ones: bunnyfly, molokai, and pyte!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if has("gui_macvim")
    set background=light
    colorscheme pyte
  else
    set background=dark
    colorscheme bunnyfly
  endif

  " TODO: Fix. gui_macvim is triggering in console...
  set background=dark
  colorscheme bunnyfly

  let g:airline_powerline_fonts = 1
  " Nice Airline themes:
  "   bubblegum, distinguished, powerlineish, raven, serene, hybridline
  let g:airline_theme="hybridline"
