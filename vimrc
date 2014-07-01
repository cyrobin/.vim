""""""""""""""""""""{{{ PLUGINS
filetype off                                " temporary -- required during vundle usage

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" require to handle other plugins
Bundle 'gmarik/vundle'
" colortheme
Bundle 'tomasr/molokai'
" Python completion - incompatible with YCM
Bundle 'davidhalter/jedi-vim'
" C/C++/Python Completion - incompatible with jedi-vim
" require the last version of vim...
"Bundle 'Valloric/YouCompleteMe'
" fancy powerline (bottom)
Bundle 'Lokaltog/vim-powerline'
" git info in the file
Bundle 'airblade/vim-gitgutter'
" ???
Bundle 'msanders/snipmate.vim'
" match parenthesis
Bundle 'vim-scripts/matchit.zip'
" comment/uncomment large amount of code
Bundle 'vim-scripts/The-NERD-Commenter'
" file tree
Bundle 'vim-scripts/The-NERD-tree'
" interesting features for rst files
"Bundle 'Rykka/riv.vim'

"}}}

""""""""""""""""""""{{{ GLOBAL
let mapleader=","                           " define new leader key
colorscheme molokai                         " a good dark colorscheme
"color summerfruit256                        " a good light colorscheme
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
"set showmatch                              " show matching brackets -- no use with matchit plugin
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
"set mouse=a                                 " in case one use mouse, skip line number
set nocompatible                            " 'I want it all!' - no need for vi compatibiliy
set backup                                  " create backup of edited files
set backupdir=~/.vim/backup                 " set the backup files directory
set directory=~/.vim/tmp                   " set the tmp files directory
"set noswapfile                             " disable the *.swp created by vim to recover from crash
set fileformats=unix,dos,mac                " tell Vim how to read a file
set laststatus=2                            " Always display the status line, even if only one window is displayed
set expandtab                               " insert spaces instead of tab character
                                            " Use <C-V><Tab> to enter a real tab character
set softtabstop=4 tabstop=4 shiftwidth=4    " set tab value for its different usages
set ruler                                   " display the cursor position on the last line of the screen
set t_Co=256                                " force 256 colors
set invhls
"set clipboard=unnamed                       " Uses OS clipboard (mouse clipboard) (shares clipboard accross vim instances)
set clipboard=unnamedplus                   " Uses OS clipboard (C-c / C-v) (shares clipboard accross vim instances)
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

set shell=zsh                               " use zsh as the default shell for :! cmd
"set shellcmdflag=-ci                       " load zshrc (interactive shell)
"set foldmethod=marker                       " use marker to define folds
"set foldmethod=indent                       " use indentation to define folds -- related to tabvalue.
set foldmethod=syntax                       " use syntax to define folds

"}}}

""""""""""""""""""""{{{ FILES SPECIFIC

au BufRead /tmp/mutt-*          set ft=mail
au BufRead /tmp/mutt-*          set invhls
au BufRead /tmp/mutt-*          set textwidth=72
au BufRead /tmp/mutt-*          set spelllang=en,fr
au BufRead /tmp/mutt-*          set spell
au BufRead /tmp/mutt-*          normal zR

au BufNewFile *.html 0r ~/.vim/templates/html.txt
au BufRead,BufNewFile *.jsm setfiletype javascript
au BufRead,BufNewFile *.xul setfiletype xml
au filetype html,xml            set listchars-=tab:>.

au BufRead,BufNewFile *.md      set syntax=rst
au BufRead,BufNewFile *.ecl     set syntax=prolog
au BufRead,BufNewFile *.ins     set syntax=tex

au BufRead,BufNewFile *.ability set syntax=c
au BufRead,BufNewFile *.task    set syntax=c

au BufRead,BufNewFile *.zsh-theme    set syntax=zsh

" when opening a file, jump to the last known cursor position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
  \ endif

"filetype plugin indent on "Detection to determine the type of the current file

au BufRead *.stl so $VIMRUNTIME/syntax/html.vim
au BufNewFile,BufRead *.rst so $VIMRUNTIME/syntax/rst.vim
au BufNewFile,BufRead *.rst setlocal spell spelllang=en,fr
au BufRead,BufNewFile *.tex setlocal spell spelllang=en,fr

"let g:languagetool_jar=$HOME . '/Program/LanguageTool/LanguageTool.jar'
"
"Completion Python
autocmd FileType python set omnifunc=pythoncomplete#Complete
:au BufWinEnter *.py let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
:au BufWinEnter *.py let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

autocmd filetype html set omnifunc=htmlcomplete#CompleteTags
autocmd filetype css set omnifunc=csscomplete#CompleteCSS
au filetype javascript set omnifunc=javascriptcomplete#CompleteJS
au filetype c set omnifunc=ccomplete#Complete
au filetype php set omnifunc=phpcomplete#CompletePHP
au filetype ruby set omnifunc=rubycomplete#Complete
au filetype sql set omnifunc=sqlcomplete#Complete
au filetype xml set omnifunc=xmlcomplete#CompleteTags

autocmd FileType html set shiftwidth=2 "Défini 2 espace comme taille d'indentation
autocmd FileType html set tabstop=2 "Défini 2 espace comme taille d'indentation
autocmd FileType html set softtabstop=2 "Nombre d'espaces qu'un <Tab> ou <RetArr> représentent

autocmd FileType tex set shiftwidth=2 "Défini 2 espace comme taille d'indentation
autocmd FileType tex set tabstop=2 "Défini 2 espace comme taille d'indentation
autocmd FileType tex set softtabstop=2 "Nombre d'espaces qu'un <Tab> ou <RetArr> représentent

"Surligne les espaces de fin de ligne
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" Supprime automatiquement les espaces de fin de ligne
"autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e

au FileType xhtml,html,htmhp,xml setlocal tabstop=2
au FileType xhtml,html,htmhp,xml setlocal shiftwidth=2
au FileType xhtml,html,htmhp,xml setlocal expandtab      " (et) expand tabs to spaces (use :retab to redo entire file)
au FileType xhtml,html,htmhp,xml setlocal softtabstop=2   " (sts) makes spaces feel like tabs (like deleting)

au FileType c,h,java,js setlocal mps+==:;                   " allow the match pairs operation (%) to work with '=' and ';'
"
au FileType c,h setlocal cindent                            " enable the intelligent cindent (cin) feature for the following files
au FileType java,js setlocal smartindent                    " enable the smartindenting (si) feature for the following files

au FileType txt setlocal fo+=tn

"}}}

""""""""""""""""""""{{{ MISCELLANEOUS SETTINGS
"" (dict) dictionary used for keyword completion
"" to use: while in insertion mode and in the middle of a word, type <ctrl-n> and <ctrl-p>
"set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
"set complete-=k complete+=k
"
"" (tsr) thesaurus used for keyword completion
"" to use: while in insertion mode and at the BEGINNING of a word, type <ctrl-x> then <ctrl-n>
""set thesaurus-=/usr/share/dict/mobythes.aur thesaurus+=/usr/share/dict/mobythes.aur
""set complete-=k complete+=k

"}}}
"
" Spell shortcuts (memo)
"   To move to a misspelled word, use ]s and [s.
"   z= will suggest a list of alternatives that may be correct.
"   Just hit Enter if none of the suggestions work, or enter the number for the correct word.
"   Use zg to add the word to the dictionary. 
"   You can also mark words as incorrect using zw.
"
" For auto-completion use CTRL-p and CTRL-n

""""""""""""""""""""{{{ VIM MODES DISPLAY and SETTINGS

" Adapt the color and shape of the cursor depending on the vim current mode
" Cursor Color -- for compatible terminal
if &term =~ "xterm\\|rxvt"
  " use an light blue cursor in insert mode
  let &t_SI = "\<Esc>]12;#00BFFF\x7"
  " use a green cursor otherwise
  let &t_EI = "\<Esc>]12;green\x7"
  silent !echo -ne "\033]12;green\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

" Cursor Shape -- for compatible terminal
" Note : it seems that urxvt does not support this feature
if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 2 -> solid block
  " 3 -> blinking underscore
  " 4 -> solid underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

" Handle automatically the paste mode when pasting from clipboard
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Handle the automatic paste mode in t-mux
" (need to double escape)
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

"}}}

""""""""""""""""""""{{{ CUSTOM FUNCTIONS

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

""" Allow/disallow textwidth formating
function! ToggleTextwidthMode()
  if (&textwidth != 80)
    set textwidth=80
  else
    set textwidth=0
  endif
endfunc

""" Switch between tab value
function! SwitchTabValue()
  if (&softtabstop == 4 || &tabstop == 4 || &shiftwidth == 4)
    set softtabstop=2 tabstop=2 shiftwidth=2
  else
    set softtabstop=4 tabstop=4 shiftwidth=4
  endif
endfunc

" Delete trailing white space
function! DeleteTrailingWS()
  execute "normal mz"
  %s/\s\+$//ge
  execute "normal `z"
endfunc

" Delete trailing white space on save for some specific files
"autocmd BufWrite *.py :call DeleteTrailingWS()
"autocmd FileType c,cpp,python,prolog autocmd BufWrite :call DeleteTrailingWS()

"}}}

""""""""""""""""""""{{{  MUTT-SPECIFIC FUNCTIONS
"" Mutt auto-completion in vim (use goobook)
""
"    fun! MailcompleteC(findstart, base)
"        if a:findstart == 1
"            let line = getline('.')
"            let idx = col('.')
"            while idx > 0
"                let idx -= 1
"                let c = line[idx]
"                " break on header and previous email
"                if c == ':' || c == '>'
"                    return idx + 2
"                else
"                    continue
"                endif
"            endwhile
"            return idx
"        else
"            if exists("g:goobookrc")
"                let goobook="goobook -c " . g:goobookrc
"            else
"                let goobook="goobook"
"            endif
"            let res=system(goobook . ' query ' . shellescape(a:base))
"            if v:shell_error
"                return []
"            else
"                "return split(system(trim . '|' . fmt, res), '\n')
"                return MailcompleteF(MailcompleteT(res))
"            endif
"        endif
"    endfun
"
"    fun! MailcompleteT(res)
"        " next up: port this to vimscript!
"        let trim="sed '/^$/d' | grep -v '(group)$' | cut -f1,2"
"        return split(system(trim, a:res), '\n')
"    endfun
"
"    fun! MailcompleteF(contacts)
"        "let fmt='awk ''BEGIN{FS="\t"}{printf "%s <%s>\n", $2, $1}'''
"        let contacts=map(copy(a:contacts), "split(v:val, '\t')")
"        let ret=[]
"        for [email, name] in contacts
"            call add(ret, printf("%s <%s>", name, email))
"        endfor
"        return ret
"    endfun
"
"
"    set completefunc=MailcompleteC

"}}}

""""""""""""""""""""{{{ ABBREVIATIONS
abbreviate #i #include
abbreviate #d #define

abbreviate <a <a href=""></a><left><left><left><left><left>
abbreviate <i <img src="" /><left><left><left>

abbreviate "" &quot;&quot;<left><left><left><left><left>

abbreviate <? <?php?><left><left>

"}}}

""""""""""""""""""""{{{ COMMAND REFERENCES

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

" za        - fold toggle   toggles between open/closed fold (zA does it recursively)
" zf        - create/define a fold (compatible with motion or visual mode)
" zc        - fold close    (zC is recursive)
" zo        - fold open     (zO is recursive)
" zm        - fold more     increases foldlevel by 1 (zM opens all folds)
" zr        - fold reduce   decreses foldlevel by 1 (zR closes all folds

" Native alternative to <ESC> : <CTRL + C >

" * register refers to the system clipboard
" e.g. :    copy   "*dd    or  1G"*yG
"           paste  "*dd    or  1G"*yG

" +2yy      - copy two lines to X11 clipboard
" +dd       - cut line to X11 clipboard
" +p        - paste X11 clipboard

" see also  set clipboard=unnamed

"}}}

""""""""""""""""""""{{{ KEYBINDINGS (includings plugins) AND ALIAS
" bépo layout
"if $MYLAYOUT=="bepo"
    "source ~/.vim/vimrc.bepo
"else
"" default layout : qwerty/azerty
    "source ~/.vim/vimrc.qwerty
"endif
source ~/.vim/vimrc.bepo

" Alias (depends on the keybindings)
" One may want to use the ".vim/syntax/" system instead :
" the following work-around enable alias for multiple keyboard layouts
au filetype rst execute "source ~/.vim/alias/".my_layout."/rst.vim"
au filetype tex execute "source ~/.vim/alias/".my_layout."/tex.vim"



"}}}

