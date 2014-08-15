""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initialization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" Vundle plugin manager.
  filetype off
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  Bundle 'gmarik/vundle'
  Bundle 'scrooloose/nerdtree'
  Bundle 'tpope/vim-surround'
  Bundle 'tpope/vim-fugitive'
  Bundle 'vim-scripts/vimwiki'
  Bundle 'Lokaltog/powerline'
  Bundle 'Shougo/unite.vim'

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
" Last search.
  noremap k n|noremap K N
" BOL/EOL/Join Lines.
  noremap l ^|noremap L $|noremap <C-l> J
" _r_ = inneR text objects.
  onoremap r i
" EOW.
" TODO: I never use this. Use for something else?
  noremap j e|noremap J E


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Colemak Arrow-Based Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch tabs.
  nnoremap <C-i> <C-PageDown>|nnoremap <C-h> <C-PageUp>
" Switch panes.
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
" +/- increment and decrement.
  nnoremap + <C-a>|nnoremap - <C-x>
" Jump to exact mark location with ' instead of line.
  noremap ' `|noremap ` '
" zT/zB is like zt/zb, but scrolls to the top/bottom quarter of the screen.
  nnoremap <expr> zT 'zt' . winheight(0)/4 . '<C-y>'
  nnoremap <expr> zB 'zb' . winheight(0)/4 . '<C-e>'
" Auto-bracket.
  inoremap {<CR> {<CR>}<Esc>O
" Disable bad habits. Unfortunately, <C-m> == <CR>, so Mid is M until my fingers forget <CR>.
  nnoremap <CR> <Nop>|nnoremap <Space> <Nop>|nnoremap <BS> <Nop>|nnoremap <Del> <Nop>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Leader Mappings
"
" Plugin-specific mappings are set in the plugin's section.
"
" Leader Conventions:
"   <Leader> (NERDTree)
"   <Space>, /, b, f, y (Unite)
"   d (Diff Tools)
"   j (Eclim Java)
"   p (Eclim Project)
"   w (VimWiki)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" Toggle paste mode.
  nnoremap <Leader>v :set invpaste<CR>:set paste?<CR>
" Diff
  nnoremap <silent> <Leader>dt :diffthis<CR>
  nnoremap <silent> <Leader>do :diffoff<CR>
  nnoremap <silent> <Leader>dd :call DiffToggle()<CR>
    function! DiffToggle()
      if &diff
        diffoff
      else
        diffthis
      endif
    :endfunction


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
" Unite
"
" TODO: Install vimproc so files can be loaded /async
" TODO: Get ack working!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:unite_source_history_yank_enable = 1
  call unite#filters#matcher_default#use(['matcher_glob'])
  " NOTE: Potentially interesting options: -here -marked-icon=
  nnoremap <Leader><Space> :<C-u>Unite -auto-resize -prompt=⮀\  -buffer-name=files   -start-insert file<cr>
  nnoremap <Leader>f       :<C-u>Unite -auto-resize -prompt=⮀\  -buffer-name=files   -start-insert file_rec:!<cr>
  nnoremap <Leader>/       :<C-u>Unite -auto-resize -prompt=⮀\  -buffer-name=files   -start-insert line<cr>
  nnoremap <Leader>b       :<C-u>Unite -auto-resize -prompt=⮀\  -buffer-name=buffer  -start-insert buffer<cr>
  nnoremap <Leader>y       :<C-u>Unite -auto-resize -prompt=⮀\  -buffer-name=yank    history/yank<cr>

  " Custom mappings for the Unite buffer.
  autocmd FileType unite call s:unite_settings()
  function! s:unite_settings()
    " Play nice with SuperTab.
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    " TODO: Make these actually work!
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    nnoremap <Esc>        <Plug>(unite_exit)
  endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
  "set noshowmode                       " Hide the default mode text in the ex line.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Eclim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  nnoremap <silent> <Leader>pe :PingEclim<CR>
  nnoremap <silent> <Leader>pi :ProjectInfo<CR>
  nnoremap <silent> <Leader>pl :ProjectList<CR>
  nnoremap <silent> <Leader>pr :ProjectRefresh<CR>
  nnoremap <silent> <Leader>jc :JavaCorrect<CR>
  nnoremap <silent> <Leader>jd :JavaDocPreview<CR>
  nnoremap <silent> <Leader>jf :JavaFormat<CR>
  nnoremap <silent> <Leader>ji :JavaImportOrganize<CR>
  nnoremap <Leader>jr :JavaRename 
" Show signs for: 0: None. 1: Fatal errors. 2: Errors. 3: Warnings. 4: Info. 5: Debugs. 6: Traces.
  let g:EclimSignLevel = 5


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
" VikWiki
"
" To mirror VimWiki from Dropbox folder: ln -s ~/Dropbox/vimwiki ~/.vimwiki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:vimwiki_list = [{
    \    'path':                       '~/.vimwiki/',
    \    'path_html':                  '~/.vimwikihtml/',
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
    \    'syntax':                     'default',
    \    'index':                      'index',
    \    'ext':                        '.wiki',
    \    'temp':                       0
    \    }]
  let g:vimwiki_camel_case = 0                   " Don't automatically make CamelCase words links.
  noremap <C-S-M-q> @<Plug>VimwikiNextLink       " Avoid <Tab> jumping to next link.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PyDict Autocompletion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To Remove?
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " j1: Set java-indenting
  " +2s: Indenting a continuing line by 2 * shiftwidth
  " l1: Align brackets with the case label
  au BufRead,BufNewFile *.java setl cinoptions=j1,+2s,l1
  let g:SuperTabDefaultCompletionType = "<C-x><C-u>"       " Use 'user' completion as default.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors (Always at bottom of .vimrc)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if has("gui_macvim")
    set background=light
    colorscheme pyte
  else
    set background=dark
    colorscheme bunnyfly
    "colorscheme molokai
  endif
