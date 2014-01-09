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

" Machine specific settings.
  let hostname = substitute(substitute(system('hostname'), '\n', '', ''), '\.local', '', '')
  if hostname == "Snail"                                   " Mac Mini
  elseif hostname == "sparrow.sea.corp.google.com"         " Workstation
    let g:enable_local_swap_dirs = 1   " Swap files > /usr/local/google/tmp/vim_tmp
    source /usr/share/vim/google/google.vim
  else
  endif


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
  nnoremap <c-i> <C-PageDown>|nnoremap <c-h> <C-PageUp>
" Switch panes.
  noremap H <C-W>h|noremap I <C-W>l|noremap N <C-W>j|noremap E <C-W>k
" Moving windows around.
  noremap <C-W>N <C-W>J|noremap <C-W>E <C-W>K|noremap <C-W>I <C-W>L
" High/Low/Mid.
  noremap <c-e> H|noremap <c-n> L|noremap <c-m> M
" Scroll up/down.
  noremap zn <c-y>|noremap ze <c-e>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The best!
  noremap ; :
" Sane redo.
  noremap U <C-r>
" Backspace works.
  noremap <BS> X|vnoremap <BS> d
" +/- increment and decrement.
  nnoremap + <C-a>|nnoremap - <C-x>
" Jump to exact mark location with ' instead of line.
  noremap ' `|noremap ` '
" zT/zB is like zt/zb, but scrolls to the top/bottom quarter of the screen.
  nnoremap <expr> zT 'zt' . winheight(0)/4 . '<c-y>'
  nnoremap <expr> zB 'zb' . winheight(0)/4 . '<c-e>'
" Auto-bracket.
  inoremap {<CR> {<CR>}<Esc>O


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Leader Mappings
"
" Plugin-specific mappings are set in the plugin's section.
"
" Leader Conventions:
"   <Leader><Leader> (NERDTree)
"   <Leader>d* (Diff Tools)
"   <Leader>j* (Eclim Java)
"   <Leader>p* (Eclim Project)
"   <Leader>w* (VimWiki)
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
" Keys
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
" Tlist - taglist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "noremap <Leader>t    :TlistToggle<cr>
  "noremap <Leader>T    :TlistUpdate<cr>
  " this is just to keep it from throwing an already mapped <Leader>t warning
  noremap <Leader><c-t> <Plug>TaskList
" Options
  let g:Tlist_WinWidth = 30                      " Default width.
  let g:Tlist_Inc_Winwidth = 0                   " Taglist doesn't make window wider.
  let g:Tlist_GainFocus_On_ToggleOpen = 1        " Toggle gives focus to taglist.
  let g:Tlist_Auto_Highlight_Tag = 0             " Don't auto-highlight current tag.
  let g:Tlist_Enable_Fold_Column = 0             " Disabled folding.


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
  noremap <c-s-m-q> @<Plug>VimwikiNextLink       " Avoid <Tab> jumping to next link.


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
  let g:SuperTabDefaultCompletionType = "<c-x><c-u>"       " Use 'user' completion as default.


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
