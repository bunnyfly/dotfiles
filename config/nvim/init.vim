set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  filetype off
  call plug#begin('~/.vim/plugged')
" Plugins - UI
  Plug 'itchyny/lightline.vim' " A light and configurable statusline/tabline plugin for Vim
  Plug 'mhinz/vim-signify' " Show a diff using Vim's sign column.
  Plug 'sonph/onehalf', { 'rtp': 'vim/' }
  Plug 'tsiemens/vim-aftercolors' " Support for after/colors/ scripts
" Plugins - Navigation
  Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'ggandor/leap.nvim'
" Plugins - Editing
  Plug 'tpope/vim-abolish' " Easy search for, substitute, & abbreviate multiple variants of a word
  Plug 'tpope/vim-repeat' " Enable repeating supported plugin maps with .
  Plug 'tpope/vim-surround' " Quoting/parenthesizing made simple.
" Plugins - LSP and languages
  Plug 'neovim/nvim-lspconfig'
  Plug 'sheerun/vim-polyglot' " Multi-language syntax highlighting. “One to rule them all.”
  Plug 'psf/black', { 'for': 'python', 'tag': '19.10b0' } " Uncompromising Python formatter. “Any color you like.”
  Plug 'prettier/vim-prettier', { 'do': 'npm install' } " JS/TS/CSS/HTML Opinionated code formatter.
" Plugins - Markdown Wiki
  " Plug 'lervag/wiki.vim'
  " Plug 'godlygeek/tabular'
  " Plug 'preservim/vim-markdown'
  " Plug 'vimwiki/vimwiki'
" Wrap up plugins!
  call plug#end()
  filetype plugin indent on


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
" HNEI arrows. (Swapping 'gn'/'ge' and 'n'/'e'.)
  noremap n gj|noremap e gk|noremap i l|noremap gn j|noremap ge k
" in(S)ert. The default s/S is synonymous with cl/cc and is not very useful.
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
  nnoremap <C-h> <C-PageUp>|nnoremap <C-i> <C-PageDown>
" Switch panes with Shift.
  noremap H <C-w>h|noremap I <C-w>l|noremap N <C-w>j|noremap E <C-w>k
" Moving windows around.
  noremap <C-w>N <C-w>J|noremap <C-w>E <C-w>K|noremap <C-w>I <C-w>L
" High/Low. Mid remains `M` since <C-m> is unfortunately interpreted as <CR>.
  noremap <C-e> H|noremap <C-n> L
" Scroll screen up/down.
  noremap zn <C-y>|noremap ze <C-e>
" Jumplist and changelist.
  nnoremap gh <C-o>|nnoremap gi <C-i>|nnoremap gH g;|nnoremap gI g,


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The best!
  noremap ; :|noremap : ;
" Sane redo.
  noremap U <C-r>
" Y consistent with C and D.
  noremap Y y$
" +/- increment and decrement.
  nnoremap + <C-a>|nnoremap - <C-x>
" Jump to exact mark location with ' instead of line.
  noremap ' `|noremap ` '
" Switch between most recent buffer with backspace
  nnoremap <BS> <C-^>
" zT/zB is like zt/zb, but scrolls to the top/bottom quarter of the screen.
  nnoremap <expr> zT 'zt' . winheight(0)/4 . '<C-y>'
  nnoremap <expr> zB 'zb' . winheight(0)/4 . '<C-e>'
" Auto-bracket.
  inoremap {<CR> {<CR>}<Esc>O


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Display.
  set shortmess+=I                     " Hide splash screen.
  set showtabline=1                    " Show tabs only when multiple tabs are open.
  set statusline=%<%t%h%m%r%h%w%y\ %L\,\ Col\ %-3v\ %P
  set updatetime=100                   " Reduce swap-writing update time (better for vim-signify)
" Text Display.
  syntax on                            " Syntax highlighting.
  set number                           " Show line numbers.
  set textwidth=100                    " Max line width.
  set colorcolumn=+1                   " Vertical line at textwidth.
  set guicursor+=a:blinkon0            " Turn cursor blinking off.
  set wrap                             " Wrapping on.
  set lbr                              " Wrap at word.
  set showbreak=···\                   " Line break indicator.
" Two-space tabs.
  set expandtab                        " Use spaces.
  set tabstop=2|set softtabstop=2      " Tabs = 2 spaces.
  set shiftwidth=2                     " Indentation (<< and >>) = 2 spaces.
" Editing.
  set whichwrap+=<,>,h,l,b,s,[,]       " Backspace and arrows can wrap to previous/next line.
  set splitbelow|set splitright        " Open new splits below and to the right.
" Searching and matching.
  set nowrapscan                       " Don't wrap search to beginning of file.
  set ignorecase|set smartcase         " Ignore case when only lowercase letters are used.
                                       " Force matching with \c (ignore) or \C (match).
  set gdefault                         " Substitute all matches in a line (i.e. :s///g) by default.
  set showmatch                        " When a bracket is inserted, flash the matching one.
" System.
  filetype plugin indent on            " Load filetype plugin and indent files.
  set mouse=a                          " Enable the mouse in all possible modes.
  set confirm                          " Confirm quit/save/etc.
  set wildmode=longest,full            " Tab complete longest common string, then each full match.
  let g:python3_host_prog='/usr/local/bin/python3'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Mappings
"
" Plugin-specific mappings are set in the plugin's section.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

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
" nvim-tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  lua require('init-nvim-tree')
  nnoremap <silent> <Leader><Leader> :NvimTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " FZF commands
  let g:fzf_command_prefix = 'Fzf'
  nnoremap <silent> <Leader>a :FzfAg<cr>
  nnoremap <silent> <Leader>r :FzfAgContent<cr>
  nnoremap <silent> <Leader>f :FzfFiles<cr>
  nnoremap <silent> <Leader>h :FzfHelptags<cr>
  nnoremap <silent> <Leader>/ :FzfBLines<cr>
  nnoremap <silent> <Leader>: :FzfHistory:<cr>
  nnoremap <silent> <Leader>; :FzfHistory:<cr>

  command! -bang -nargs=* FzfAgContent call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

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
" leap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " lua require('leap').add_default_mappings()
  nnoremap ( <Plug>(leap-backward-to)
  nnoremap ) <Plug>(leap-forward-to)
  nnoremap g) <Plug>(leap-from-window)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Hide ex-line mode since it's displayed in lightline.
  set noshowmode
  let g:lightline = {}
  let g:lightline.colorscheme = 'wombat'
  let g:lightline.component_function = {
        \ 'filename': 'LightlineFilename'
      \ }
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
  " Abbreviated mode strings
  let g:lightline.mode_map = {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
      \ }

  " A custom Lightline filename that includes the file's parent directory.
  function! LightlineFilename()
      return expand('%:p:h:t') . '/' . expand('%:t')
  endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prettier
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
" Signify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:signify_vcs_list = ['git']
  " No realtime. Signify auto-saves modified buffers with realtime enabled. wtf.
  let g:signify_realtime = 0
  " Highlight line numbers
  let g:signify_number_highlight = 1

  let g:signify_sign_add = '+'
  let g:signify_sign_change = '~'
  let g:signify_sign_delete = '_'
  let g:signify_sign_delete_first_line = '‾'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimWiki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:vimwiki_list = [{
    \    'path':                       '~/wiki/',
    \    'path_html':                  '~/wikihtml/',
    \    'maxhi':                      1,
    \    'css_name':                   'style.css',
    \    'auto_export':                0,
    \    'diary_index':                'diary',
    \    'diary_link_fmt':             '%Y-%m-%d',
    \    'diary_link_count':           4,
    \    'diary_header':               'Diary',
    \    'diary_rel_path':             'diary/',
    \    'nested_syntaxes':            {},
    \    'html_header':                '',
    \    'html_footer':                '',
    \    'syntax':                     'markdown',
    \    'index':                      'index',
    \    'ext':                        '.md',
    \    'temp':                       0
    \    }]
  let g:vimwiki_camel_case = 0                   " Don't automatically make CamelCase words links.
  noremap <C-S-M-q> @<Plug>VimwikiNextLink       " Avoid <Tab> jumping to next link.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Don't auto-fold everything!
  let g:vim_markdown_folding_disabled = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" wiki.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:wiki_root = '~/wiki'
  " Only enable wiki.vim for files within g:wiki_root
  let g:wiki_global_load = 0
  " Use Markdown!
  let g:wiki_filetypes = ['md']
  let g:wiki_link_extension = '.md'
  " Misc
  let g:wiki_index_name = 'index'
  let g:wiki_journal = 'weekly'
  let g:wiki_journal = {
      \   'name': 'journal',
      \   'frequency': 'weekly',
      \   'index_use_journal_scheme': v:true,
      \   'date_format': {
      \     'daily' : '%Y-%m-%d',
      \     'weekly' : '%Y_w%V',
      \     'monthly' : '%Y_m%m',
      \   },
      \ }
  " Even though using [Markdown](url), use much nicer [[Wiki Style Links]]
  let g:wiki_link_target_type = 'wiki'
  " Auto-save when navigating
  let g:wiki_write_on_nav = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lua require('init-lsp')
  " nnoremap <silent> <space>e <cmd>lua vim.diagnostic.open_float()<cr>
  " nnoremap <silent> [d <cmd>lua vim.diagnostic.goto_prev()<cr>
  " nnoremap <silent> ]d <cmd>lua vim.diagnostic.goto_next()<cr>
  " nnoremap <silent> <space>q <cmd>lua vim.diagnostic.setloclist()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"
" Good ones: bunnyfly, molokai, onehalfdark, wombat!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Enable true colors
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif

  set background=dark
  colorscheme onehalfdark
