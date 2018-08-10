""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initialization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" Plugins!
  filetype off
  call plug#begin('~/.vim/plugged')
" Plugins - UI
  Plug 'scrooloose/nerdtree' " A tree explorer plugin for vim.
  Plug 'majutsushi/tagbar' " Displays tags in a window, ordered by scope.
  Plug 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air.
  Plug 'vim-airline/vim-airline-themes' " A collection of themes for vim-airline.
" Plugins - Editing
  Plug 'tpope/vim-abolish' " easily search for, substitute, & abbreviate multiple variants of a word
  Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with .
  Plug 'tpope/vim-surround' " quoting/parenthesizing made simple.
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'SirVer/ultisnips' " UltiSnips - The ultimate snippet solution for Vim
  Plug 'honza/vim-snippets' " UltiSnips snippets (originally vim-snipmate)
" Plugins - Languages
  Plug 'leafgarland/typescript-vim' " Typescript syntax files for Vim.
  Plug 'fatih/vim-go' " Go development plugin for Vim.
" Plugins - Denite
  Plug 'Shougo/denite.nvim'
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
  set statusline=%<%t%h%m%r%h%w%y\ %{fugitive#statusline()}%=\ Ln\ %l\/%L\,\ Col\ %-3v\ %P
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
  let g:UltiSnipsExpandTrigger = "<Tab>"
  let g:UltiSnipsListSnippets = "<S-tab>"
  let g:UltiSnipsJumpForwardTrigger = "<C-i>"
  let g:UltiSnipsJumpBackwardTrigger = "<C-h>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Denite
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  call denite#custom#option('default', 'prompt', '⮀')

  " Use ag - the silver surfer!
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])

  " Commands.
  " Some to try later: directory_rec, file, file/old
  nnoremap <silent> <Space>a
        \ :<C-u>Denite -cursor-wrap -vertical-preview -auto-preview -winheight=60 -auto-resize
        \ grep<cr>
  " TODO: Change cmd
  nnoremap <silent> <Space>f
        \ :<C-u>Denite -cursor-wrap -vertical-preview -auto-preview -winheight=60 -auto-resize
        \ file_rec<cr>
  nnoremap <silent> <Space>;
        \ :<C-u>Denite -cursor-wrap -vertical-preview -auto-preview -winheight=60 -auto-resize
        \ command_history<cr>
  nnoremap <silent> <Space>:
        \ :<C-u>Denite -cursor-wrap -vertical-preview -auto-preview -winheight=60 -auto-resize
        \ command_history<cr>
  nnoremap <silent> <Space>/
        \ :<C-u>Denite -cursor-wrap -vertical-preview -auto-preview -winheight=60 -auto-resize
        \ line<cr>
  nnoremap <silent> <Space>*
        \ :<C-u>Denite -cursor-wrap -vertical-preview -auto-preview -winheight=60 -auto-resize
        \ line<cr>

  " Mappings - all mode.
  " Disable global Esc so insert and normal can override.
  call denite#custom#map('_', '<Esc>', '<denite:nop>', 'noremap')

  " Mappings - insert mode.
  call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap')
  call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<C-e>', '<denite:move_to_previous_line>', 'noremap')
  call denite#custom#map(
        \ 'insert',
        \ '<C-f>',
        \ '<denite:multiple_mappings:denite:scroll_page_forwards,denite:move_to_bottom>',
        \ 'noremap')
  call denite#custom#map(
        \ 'insert',
        \ '<C-b>',
        \ '<denite:multiple_mappings:denite:scroll_page_backwards,denite:move_to_top>',
        \ 'noremap')

  " Mappings - normal mode.
  call denite#custom#map('normal', '<Esc>', '<denite:quit>', 'noremap')
  " Open mappings
  call denite#custom#map('normal', 'o', '<denite:do_action:switch>', 'noremap')
  call denite#custom#map('normal', 't', '<denite:do_action:tabopen>', 'noremap')
  call denite#custom#map('normal', 'N', '<denite:do_action:split>', 'noremap')
  call denite#custom#map('normal', 'E', '<denite:do_action:split>', 'noremap')
  call denite#custom#map('normal', 'H', '<denite:do_action:vsplit>', 'noremap')
  call denite#custom#map('normal', 'I', '<denite:do_action:vsplit>', 'noremap')
  " m prefix is to mirror NERDTree menu commands
  call denite#custom#map('normal', 'ma', '<denite:do_action:new>', 'noremap')
  call denite#custom#map('normal', 'md', '<denite:do_action:delete>', 'noremap')
  " Scrolling
  call denite#custom#map(
        \ 'normal',
        \ '<C-f>',
        \ '<denite:multiple_mappings:denite:scroll_page_forwards,denite:move_to_bottom>',
        \ 'noremap')
  call denite#custom#map(
        \ 'normal',
        \ '<C-b>',
        \ '<denite:multiple_mappings:denite:scroll_page_backwards,denite:move_to_top>',
        \ 'noremap')
  call denite#custom#map('normal', 'X', '<denite:delete_char_before_caret>', 'noremap')

  " Mappings - normal mode to roughly mirror Colemak mappings at top of vimrc.
  " HNEI arrows.
  call denite#custom#map('normal', 'h', '<denite:move_caret_to_left>', 'noremap')
  call denite#custom#map('normal', 'n', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('normal', 'e', '<denite:move_to_previous_line>', 'noremap')
  call denite#custom#map('normal', 'i', '<denite:move_caret_to_right>', 'noremap')
  " In(sert).
  call denite#custom#map('normal', 's', '<denite:enter_mode:insert>', 'noremap')
  call denite#custom#map('normal', 'S', '<denite:insert_to_head>', 'noremap')
  " TODO: Repeat search
  " BOL/EOL/Join.
  call denite#custom#map('normal', 'l', '<denite:move_caret_to_head>', 'noremap')
  call denite#custom#map('normal', 'L', '<denite:move_caret_to_tail>', 'noremap')
  " EOW.
  call denite#custom#map('normal', 'j', '<denite:move_caret_to_end_of_word>', 'noremap')
  " High/Low/Mid
  call denite#custom#map('normal', '<C-n>', '<denite:move_to_bottom>', 'noremap')
  call denite#custom#map('normal', '<C-e>', '<denite:move_to_top>', 'noremap')
  call denite#custom#map('normal', 'M', '<denite:move_to_middle>', 'noremap')
  call denite#custom#map('normal', '<C-m>', '<denite:move_to_next_line>', 'noremap')
  " Scroll up/down.
  call denite#custom#map('normal', 'ze', '<denite:scroll_window_up_one_line>', 'noremap')
  call denite#custom#map('normal', 'zn', '<denite:scroll_window_down_one_line>', 'noremap')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM - YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Note: Needs to play nicely with UltiSnips
  let g:ycm_key_list_select_completion = ['<C-n>']
  let g:ycm_key_list_previous_completion = ['<C-e>']
  let g:ycm_key_invoke_completion = "<C-i>"


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
