""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initialization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" Plugins!
  filetype off
  call plug#begin('~/.vim/plugged')
" Plugins - UI
  Plug 'itchyny/lightline.vim' " A light and configurable statusline/tabline plugin for Vim
  Plug 'mhinz/vim-signify' " Show a diff using Vim's sign column.
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
" Plugins - Navigation
  " defx - The dark powered file explorer implementation
  if has('nvim')
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  Plug 'kristijanhusak/defx-git' " Git status column for defx
  " Install FZF via vim (vs referencing existing install) to avoid out of sync version issues.
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
" Plugins - Editing
  Plug 'tpope/vim-abolish' " easily search for, substitute, & abbreviate multiple variants of a word
  Plug 'tpope/vim-commentary' " comment stuff out
  Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with .
  Plug 'tpope/vim-surround' " quoting/parenthesizing made simple.
" Plugins - Autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plugins - Languages
  Plug 'pangloss/vim-javascript' " syntax highlighting and improved indentation
  Plug 'leafgarland/typescript-vim' " Typescript syntax files for Vim.
  Plug 'psf/black', { 'for': 'python' } " The uncompromising Python code formatter. “Any color you like.”
  Plug 'prettier/vim-prettier', { 'do': 'npm install' } " JS/TS/CSS/HTML Opinionated code formatter.
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
"   <Leader><Leader> (defx)
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
  set showmatch                        " When a bracket is inserted, flash the matching one.
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
" Black
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  autocmd BufWritePre *.py execute ':Black'
  let g:black_linelength = 100
  let g:black_skip_string_normalization = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-prettier
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:prettier#autoformat = 0
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.json,*.md,*.yaml,*.scss,*.css,*.less PrettierAsync

  " max line length that prettier will wrap on
  " Prettier default: 80
  let g:prettier#config#print_width = 100
  " number of spaces per indentation level
  " Prettier default: 2
  let g:prettier#config#tab_width = 2
  " use tabs over spaces
  " Prettier default: false
  let g:prettier#config#use_tabs = 'false'
  " print semicolons
  " Prettier default: true
  let g:prettier#config#semi = 'true'
  " single quotes over double quotes
  " Prettier default: false
  let g:prettier#config#single_quote = 'true'
  " print spaces between brackets
  " Prettier default: true
  let g:prettier#config#bracket_spacing = 'true'
  " put > on the last line instead of new line
  " Prettier default: false
  let g:prettier#config#jsx_bracket_same_line = 'true'
  " avoid|always
  " Prettier default: avoid
  let g:prettier#config#arrow_parens = 'always'
  " none|es5|all
  " Prettier default: none
  let g:prettier#config#trailing_comma = 'all'
  " flow|babylon|typescript|css|less|scss|json|graphql|markdown
  " Prettier default: babylon
  let g:prettier#config#parser = 'babylon'
  " cli-override|file-override|prefer-file
  let g:prettier#config#config_precedence = 'prefer-file'
  " always|never|preserve
  let g:prettier#config#prose_wrap = 'preserve'
  " css|strict|ignore
  let g:prettier#config#html_whitespace_sensitivity = 'css'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Defx
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  nnoremap <silent> <Leader><Leader> :Defx<CR>

  call defx#custom#option('_', {
      \ 'columns': 'git:indent:icon:filename',
      \ 'winwidth': 50,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ 'root_marker': '‣‣‣ ',
      \ })
  call defx#custom#column('indent', { 'indent': '  ' })
  call defx#custom#column('git', 'indicators', {
      \ 'Modified'  : '‣',
      \ 'Staged'    : '✚',
      \ 'Untracked' : '✭',
      \ 'Renamed'   : '➜',
      \ 'Unmerged'  : '═',
      \ 'Ignored'   : '☒',
      \ 'Deleted'   : '✖',
      \ 'Unknown'   : '?',
      \ })

  " Quit if defx is the last window.
  autocmd WinEnter * if &ft == 'defx' && winnr('$') == 1 | q | endif

  " defx mappings.
  autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
    nnoremap <silent><buffer><expr> <CR> defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('open', 'wincmd p \| drop')
    nnoremap <silent><buffer><expr> o defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('open', 'wincmd p \| drop')
	  nnoremap <silent><buffer><expr> s defx#do_action('open', 'wincmd p \| split')
	  nnoremap <silent><buffer><expr> v defx#do_action('open', 'wincmd p \| vsplit')
	  nnoremap <silent><buffer><expr> t defx#do_action('open', 'tabnew')
	  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
	  nnoremap <silent><buffer><expr> x defx#do_action('close_tree')
	  " nnoremap <silent><buffer><expr> go defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> C defx#do_action('cd', defx#get_candidate().action__path)
	  nnoremap <silent><buffer><expr> u defx#do_action('cd', '..')

	  nnoremap <silent><buffer><expr> a defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> c defx#do_action('copy')
	  nnoremap <silent><buffer><expr> p defx#do_action('paste')
	  nnoremap <silent><buffer><expr> m defx#do_action('move')
	  nnoremap <silent><buffer><expr> r defx#do_action('rename')
	  nnoremap <silent><buffer><expr> dd defx#do_action('remove')

	  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')

	  nnoremap <silent><buffer><expr> H defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
	  " nnoremap <silent><buffer><expr> u defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> q defx#do_action('quit')
	endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:signify_vcs_list = ['git']
  " No realtime. Signify auto-saves modified buffers with realtime enabled. wtf.
  let g:signify_realtime = 0

  let g:signify_sign_add = '+'
  let g:signify_sign_change = '~'
  let g:signify_sign_delete = '_'
  let g:signify_sign_delete_first_line = '‾'


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
" Coc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <C-e> pumvisible() ? "\<C-p>" : "\<S-Tab>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Hide ex-line mode since it's displayed in lightline.
  set noshowmode
  let g:lightline = {}
  let g:lightline.colorscheme = 'wombat'
  let g:lightline.active = {
			\ 'left': [ ['mode'], ['filename', 'readonly', 'modified'] ],
			\ 'right': [ ['lineinfo'], ['percent'] ],
      \ }
	let g:lightline.inactive = {
			\ 'left': [ ['filename', 'readonly', 'modified'] ],
			\ 'right': [ ['lineinfo'], [ 'percent'] ],
      \ }
	let g:lightline.tabline = {
			\ 'left': [ ['tabs'] ],
			\ 'right': [ ],
      \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors (Always at bottom of .vimrc)
"
" Good ones: bunnyfly, molokai, and pyte!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set background=dark
  colorscheme bunnyfly
