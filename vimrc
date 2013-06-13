"""""""""""""""""""" PLUGINS
filetype off                                " temporary -- required during vundle usage

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tomasr/molokai'
Bundle 'davidhalter/jedi-vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'msanders/snipmate.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'vim-scripts/The-NERD-tree'
"Bundle 'vim-scripts/Command-T'

"""""""""""""""""""" GLOBAL
let mapleader=","                           " define new leader key
colorscheme molokai                         " a good colorsheme
set gfn=terminus                            " set GUI font
set go=                                     " set GUI option (none here)

syntax on                                   " for auto syntax coloration
filetype plugin indent on                   " for auto indent
set encoding=utf-8                          " utf-8 is good for you
set hidden                                  " hide buffers instead of closing them
set showcmd                                 " bottom line shows current command going on
set backspace=indent,eol,start              " backspace over autoindent, EOL and start of insert
set autoindent                              " auto-indenting
set copyindent                              " when auto-indenting, use the indenting format of the previous line
set number                                  " show line numbers
set shiftround                              " >>/<< moves to the next multiple value of shiftwidth
set ignorecase                              " ignore case during search : lower case counts for upper case too
set smartcase                               " but if I put case variation in my search, it's cause I care
set hlsearch                                " highlight search matches
set incsearch                               " incremental search (jump to partial match)
"set shwomatch                              " show matching brackets -- no use with matchit plugin
set history=50                              " keep some history
set undolevels=100                          " keep some memory for undo
set textwidth=80                            " usual textwidth for wrapping
set scrolloff=12                            " keep at least this many lines above/below cursor
set sidescrolloff=8                         " keep at least this many columns left/right of cursor
set title                                   " set the title of the terminal
set novisualbell                            " no visual bell
set noerrorbells                            " neither error bell
set list                                    " whitespace characters are made visible
set listchars=tab:→·,trail:·,extends:→,precedes:→,nbsp:␣    " choose how to display those characters
set ttyfast                                 " fast local tty
set mouse=                                  " my mouse is too far from my keyboard -- disable it. Always.
set nocompatible                            " 'I want it all!' - no need for vi compatibiliy
set backup                                  " create backup of edited files
set backupdir=~/.vim/backup                 " set the backup files directory
"set directory=~/.vim_tmp                   " set the tmp files directory
"set noswapfile                             " disable the *.swp created by vim to recover from crash
set fileformats=unix,dos,mac                " tell Vim how to read a file
set laststatus=2                            " Always display the status line, even if only one window is displayed
set expandtab                               " insert spaces instead of tab character
                                            " Use <C-V><Tab> to enter a real tab character
set softtabstop=4 tabstop=4 shiftwidth=4    " set tab value for its different usages
set ruler                                   " display the cursor position on the last line of the screen
set t_Co=256                                " force 256 colors
set invhls
set clipboard=unnamed                       " Uses OS clipboard (shares clipboard accross vim instances)
set lazyredraw                              " don't redraw when running macros
"set cursorline                             " highlight the cursor line
set tabpagemax=20                           "allow for 20 tabs when opening ; default is 10.
"set showtabline=2                          " always display upper tab line
"set showmode                               " vim lets us know which mode we're in -- no use with powerline plugin
"set showcmd                                " show partial command in last line of screen
set confirm                                 " raise dialogue instead of failing because of unsaved changes
set notimeout ttimeout ttimeoutlen=200      " Quickly time out on keycodes, but never time out on mappings
set lazyredraw                              " Don't redraw while executing macros (good performance config)
set magic                                   " For regular expressions turn magic on
set wildmode=longest,list
set wildmenu                                " Better command-line completion
" ignore these files when completing names
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*~,*.swp,*.info,*.aux,*.dvi,*.bbl,*.blg,*.brf,*.cb,*.ind,*.idx,*.ilg,*.inx,*.out,*.toc,*.cmi,*.cmo,*.swo,*.toc,
" set of file name suffixes that will be given a lower priority when it comes to matching wildcards
set suffixes+=.old


"""""""""""""""""""" KEYBINDINGS

" Ease access to visual mode commands
map v <C-v>
vmap i <S-i>

" Map for Bloc selection ?
map  # {v}! par 72<CR>
map  & {v}! par 72j<CR>

" Map split swing
nmap  <Tab> <C-w>w

" Toggle spelling (and spell language choice)
map  <leader>se :setlocal spell! spelllang=en<CR>
map  <leader>sf :setlocal spell! spelllang=fr<CR>

" Toggle highlight search
map  <Space> :set invhls<CR>

" Toggle CursorLine/-Column highlighting
" Note that CursorLine/-Column usage may significatively slow vim (especially with big file)
nmap c! :set cursorline!<cr>
nmap c? :set cursorcolumn!<cr>

" Toggle Paste mode
set pastetoggle=<leader>p

" In visual mode, replace block
cmap <C-g> <C-u><ESC>

" Allows sticky shift to go through as planned
" -bang ... <bang> allows exclamation mark to work as well
command! -bang W w<bang>
command! -bang Q q<bang>
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>

" allows to use ; instead of : : no shift needed anymore ! :-)
nnoremap ; :

" uses sudo mode afterwards
cmap w!! w !sudo tee % >/dev/null

" Forces to get used to vim interface.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" allows to use <CTRL+Space> (easy to reach) instead of escape
inoremap <C-Space> <ESC>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Ease long inner navigation (move half-screen up or down)
noremap <leader>k <C-U>
noremap <leader>j <C-D>

" Move a line of text using ALT+[jk]
" NB: it seems it does not work (<A- > or <M- > seems to have none effect :-( )
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"" Move lines up and down with ALT+k\j
"nnoremap ª :m .+1<CR>==
"nnoremap º :m .-2<CR>==
"
"inoremap ª <Esc>:m .+1<CR>==gi
"inoremap º <Esc>:m .-2<CR>==gi
"
"vnoremap ª :m '>+1<CR>gv=gv
"vnoremap º :m '<-2<CR>gv=gv

" Useful mappings for managing tabs
nmap <leader>tn :tabnew<cr>
nmap <leader>te :tabe .<cr>
nmap <leader>tt :tabe ./
nmap <leader>to :tabonly<cr>
nmap <leader>tc :tabclose<cr>
nmap <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nmap <leader>th :tabedit <c-r>=expand("%:p:h")<cr>/

" Map Vim 9 to first non-blank character
map 9 ^

" cd to the directory containing the file in the buffer
nmap  <leader>cd :lcd %:h

" Toggle displayed text wrapping
map <leader>sw :set wrap!<cr>

" Map to insert python debugger
map  <F10> <Esc>import pdb;pdb.set_trace()<CR><Esc>

"""""""""""""""""""" PLUGINS

let g:Powerline_symbols = 'fancy'

"let g:CommandTMaxFiles=5000
"let g:CommandTMaxHeight=12
"map <C-o> :CommandT<CR>
"map t :CommandT<CR>
"let g:CommandTAcceptSelectionMap = '<CR>'
"let g:CommandTCancelMap = '<C-g>'

" Map for NerdCommenter
map cc <leader>c<space>
map ca <leader>ca
map cs <leader>cs
map ci <leader>ci
vmap cc <leader>c<space>
vmap ca <leader>ca
vmap cs <leader>cs
vmap ci <leader>ci

" Params and Map for NerdTree
let NERDChristmasTree = 1
let NERDTreeSortOrder = ['\/$', '\.js*', '\.cpp$', '\.h$', '*']
nmap t :NERDTreeToggle<cr>
nmap <C-b> :NERDTreeToggle<cr>

""" Jedi disable auto completion popup
let g:jedi#popup_on_dot = 0
let g:jedi#show_function_definition = "0"

"""""""""""""""""""" FILES SPECIFIC

au BufRead mutt-*        set ft=mail
au BufRead mutt-*        set invhls
au BufNewFile *.html 0r ~/.vim/templates/html.txt
au BufRead,BufNewFile *.jsm setfiletype javascript
au BufRead,BufNewFile *.xul setfiletype xml
au filetype html,xml set listchars-=tab:>.

""filetype plugin indent on "Detection to determine the type of the current file
"
"au BufRead *.stl so $VIMRUNTIME/syntax/html.vim
"au BufNewFile,BufRead *.rst so $VIMRUNTIME/syntax/rst.vim
"au BufNewFile,BufRead *.rst setlocal spell spelllang=fr
"let g:languagetool_jar=$HOME . '/Program/LanguageTool/LanguageTool.jar'
""Completion Python
"autocmd FileType python set omnifunc=pythoncomplete#Complete
":au BufWinEnter *.py let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
":au BufWinEnter *.py let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"
"" autocmd filetype html set omnifunc=htmlcomplete#CompleteTags
"autocmd filetype css set omnifunc=csscomplete#CompleteCSS
"au filetype javascript set omnifunc=javascriptcomplete#CompleteJS
"au filetype c set omnifunc=ccomplete#Complete
"au filetype php set omnifunc=phpcomplete#CompletePHP
"au filetype ruby set omnifunc=rubycomplete#Complete
"au filetype sql set omnifunc=sqlcomplete#Complete
"au filetype xml set omnifunc=xmlcomplete#CompleteTags
"
"autocmd FileType html set shiftwidth=2 "Défini 4 espace comme taille d'indentation
"autocmd FileType html set tabstop=2 "Défini 2 espace commet taille d'indentation
"autocmd FileType html set softtabstop=2 "Nombre d'espaces qu'un <Tab> ou <RetArr> représentent
"
"au FileType xml setlocal foldmethod=syntax
""Surligne les espaces de fin de ligne
"highlight WhitespaceEOL ctermbg=red guibg=red
"match WhitespaceEOL /\s\+$/
"" Supprime automatiquement les espaces de fin de ligne
"autocmd BufWritePre * :%s/\s\+$//e

"au FileType xhtml,html,htmhp,xml setlocal tabstop=2
"au FileType xhtml,html,htmhp,xml setlocal shiftwidth=2
""au FileType xhtml,html,htmhp,xml setlocal expandtab      " (et) expand tabs to spaces (use :retab to redo entire file)
"au FileType xhtml,html,htmhp,xml setlocal softtabstop=2   " (sts) makes spaces feel like tabs (like deleting)
"
"au FileType c,h,java,js setlocal mps+==:;                   " allow the match pairs operation (%) to work with '=' and ';'
"
"au FileType c,h setlocal cindent                            " enable the intelligent cindent (cin) feature for the following files
"au FileType java,js setlocal smartindent                    " enable the smartindenting (si) feature for the following files
"
"au FileType txt setlocal fo+=tn

"""""""""""""""""""" ABBREVIATIONS
"abbreviate #i #include
"abbreviate #d #define
"
"abbreviate <a <a href=""></a><left><left><left><left><left>
"abbreviate <i <img src="" /><left><left><left>
"abbreviate l" &ldquo;&rdquo;<left><left><left><left><left><left>
"abbreviate r" &rdquo;
"abbreviate l' &lsquo;
"abbreviate r' &rsquo;
"abbreviate "" &quot;&quot;<left><left><left><left><left>
"
"abbreviate <? <?php?><left><left>


"""""""""""""""""""" MISCELLANEOUS SETTINGS

"" (dict) dictionary used for keyword completion
"" to use: while in insertion mode and in the middle of a word, type <ctrl-n> and <ctrl-p>
"set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
"set complete-=k complete+=k
"
"" (tsr) thesaurus used for keyword completion
"" to use: while in insertion mode and at the BEGINNING of a word, type <ctrl-x> then <ctrl-n>
""set thesaurus-=/usr/share/dict/mobythes.aur thesaurus+=/usr/share/dict/mobythes.aur
""set complete-=k complete+=k

"""""""""""""""""""" COMMAND REFERENCES

" *                     - searches for word under cursor
" gd                    - finds definition of variable/function under cursor
" ga                    - prints the ascii value of character under cursor
" gf                    - opens file under the cursor (in split view)
" gi                    - goes to insert mode in the same spot as you last inserted
" ~                     - changes case of character
" :r !<cmd>             - reads the output of the shell <cmd> into the file
" :% s/hello/A/gc       - typical search and replace command

" :% !tidy              - runs the code through the 'tidy' program

" :runtime! syntax/2html.vim
" :10,40TOhtml

" command reference ->  " za : fold toggle  toggles between a fold being opened and closed (zA does it recursively)
                        " zf : create/define a fold (compatible with motion or visual mode
                        " zc : fold close   close 1 fold under the cursor (zC does it recursively)
                        " zo : fold open    open 1 fold under the cursor (zO does it recursively)
                        " zm : fold more    increases foldlevel by 1 (zM opens all folds)
                        " zr : fold reduce  decreses foldlevel by 1 (zR closes all folds

"""""""""""""""""""" CUSTOM FUNCTIONS

:command -nargs=+ Find vimgrep <args>|cw

""" FocusMode
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    set noruler
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
    hi CursorLineNr ctermfg=0 ctermbg=none
  else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    execute 'colorscheme ' . g:colors_name
  endif
endfunc
nnoremap <F8> :call ToggleFocusMode()<cr>
nnoremap <leader>tf :call ToggleFocusMode()<cr>

""" Allow/disallow textwidth formating
function! ToggleTextwidthMode()
  if (&textwidth != 80)
    set textwidth=80
  else
    set textwidth=0
  endif
endfunc
nnoremap <F4> :call ToggleTextwidthMode()<cr>
nnoremap <leader>tw :call ToggleTextwidthMode()<cr>

""" Switch between tab value
function! SwitchTabValue()
  if (&softtabstop == 4 || &tabstop == 4 || &shiftwidth == 4)
    set softtabstop=2 tabstop=2 shiftwidth=2
  else
    set softtabstop=4 tabstop=4 shiftwidth=4
  endif
endfunc
nnoremap <F5> :call SwitchTabValue()<cr>
nnoremap <leader>stv :call SwitchTabValue()<cr>

" Delete trailing white space 
function! DeleteTrailingWS()
  execute "normal mz"
  %s/\s\+$//ge
  execute "normal `z"
endfunc
nnoremap <leader>cws :call DeleteTrailingWS()<cr>

" Delete trailing white space on save for some specific files
"autocmd BufWrite *.py :call DeleteTrailingWS()
"autocmd FileType c,cpp,python,prolog autocmd BufWrite :call DeleteTrailingWS()

