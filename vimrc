""""""""""""""""""""{{{ PLUGINS
filetype off                                " temporary -- required during vundle usage

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" require to handle other plugins
Plugin 'gmarik/vundle'
" colortheme
Plugin 'tomasr/molokai'
Plugin 'notpratheek/vim-luna'
" nice tab and bottom lines
Plugin 'bling/vim-airline'
" git and other cvs info in the file
Plugin 'mhinz/vim-signify'
" useful snippets
Plugin 'msanders/snipmate.vim'
" allows to configure % to match more than just single characters
" latest version (more recent than the standard vim distribution one)
Plugin 'vim-scripts/matchit.zip'
" cache Comletion
Plugin 'Shougo/neocomplete'
" 'parenthesis' and other surrounding stuff
"Plugin 'tpope/vim-surround'
" allow repeat '.' with plugins
Plugin 'tpope/vim-repeat'
" comment/uncomment large amount of code
Plugin 'vim-scripts/The-NERD-Commenter'
" file tree
Plugin 'vim-scripts/The-NERD-tree'
" easymotion
Plugin 'Lokaltog/vim-easymotion'
" Python completion - incompatible with YCM
Plugin 'davidhalter/jedi-vim'
" C/C++/Python Completion - incompatible with jedi-vim
" require the last version of vim
"Plugin 'Valloric/YouCompleteMe'
" interesting features for rst files
"Plugin 'Rykka/riv.vim'
" Code overview (= Minimap)
" TODO make it useful...
"Plugin 'severin-lemaignan/vim-minimap'
"}}}

""""""""""""""""""""{{{ GLOBAL
let mapleader=","                           " define new leader key
colorscheme molokai                         " a good dark colorscheme
"color summerfruit256                        " a good light colorscheme
if &diff                                    " diffmode uses a different colorscheme
  colorscheme luna-term
endif
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
"set textwidth=80                            " usual textwidth for wrapping
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
set foldmethod=indent                       " use indentation to define folds -- related to tabvalue.
"set foldmethod=syntax                       " use syntax to define folds

"}}}

""""""""""""""""""""{{{ ADDITIONAL CUSTOM FUNCTIONS

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

" Toggle spell with a language
" (work around for spellcheck with vundle...)
function! ToggleSpell(lang)
    if !exists("b:old_spelllang")
        let b:old_spelllang = &spelllang
        let b:old_spellfile = &spellfile
        let b:old_dictionary = &dictionary
    endif

    let l:newMode = ""
    if !&l:spell || a:lang != &l:spelllang
        setlocal spell
        let l:newMode = "spell"
        execute "setlocal spelllang=" . a:lang
        execute "setlocal spellfile=" . "~/.vim/spell/" . matchstr(a:lang, "[a-zA-Z][a-zA-Z]") . "." . &encoding . ".add"
        execute "setlocal dictionary=" . "~/.vim/spell/" . a:lang . "." . &encoding . ".dic"
        let l:newMode .= ", " . a:lang
    else
        setlocal nospell
        let l:newMode = "nospell"
        execute "setlocal spelllang=" . b:old_spelllang
        execute "setlocal spellfile=" . b:old_spellfile
        execute "setlocal dictionary=" . b:old_dictionary
    endif
    return l:newMode
endfunction

"}}}

""""""""""""""""""""{{{ FILES SPECIFIC

au BufRead /tmp/mutt-*          set ft=mail
au BufRead /tmp/mutt-*          set invhls
"au BufRead /tmp/mutt-*          set textwidth=72
au BufRead /tmp/mutt-*          set textwidth=0
au BufRead /tmp/mutt-*          setlocal fo+=aw
au BufRead /tmp/mutt-*          set spelllang=en,fr
au BufRead /tmp/mutt-*          set spell
au BufRead /tmp/mutt-*          normal zR

au BufRead,BufNewFile *.jsm     setfiletype javascript
au BufRead,BufNewFile *.xul     setfiletype xml
au BufRead *.stl so $VIMRUNTIME/syntax/html.vim
au BufNewFile *.html 0r ~/.vim/templates/html.txt
au Filetype html,xhtml,xml      set listchars-=tab:>.
au Filetype html,xhtml,xml      set foldmethod=marker
au Filetype html,xhtml,xml      set textwidth=0
au FileType html,xhtml,xml      set shiftwidth=2
au FileType html,xhtml,xml      set tabstop=2
au FileType html,xhtml,xml      set softtabstop=2
au FileType xhtml,html,xml      setlocal expandtab " (et) expand tabs to spaces (use :retab to redo entire file)

au FileType tex                 set shiftwidth=2
au FileType tex                 set tabstop=2
au FileType tex                 set softtabstop=2

au FileType python              set shiftwidth=4
au FileType python              set tabstop=4
au FileType python              set softtabstop=4
au FileType python              setlocal expandtab " (et) expand tabs to spaces (use :retab to redo entire file)

au BufRead,BufNewFile *.ecl     set syntax=prolog
au BufRead,BufNewFile *.ins     set textwidth=0
au BufRead,BufNewFile *.ins     setlocal syntax=tex
au BufRead,BufNewFile *.ability set syntax=c
au BufRead,BufNewFile *.task    set syntax=c
au BufRead,BufNewFile *.zsh-theme    set syntax=zsh

au BufRead,BufNewFile *.md      set syntax=rst
au BufRead,BufNewFile *.rst     so $VIMRUNTIME/syntax/rst.vim
au BufRead,BufNewFile *.md      so $VIMRUNTIME/syntax/rst.vim
au BufRead,BufNewFile *.rst,*.md,*.tex call ToggleSpell("en_gb")

au BufRead,BufNewFile *.mod,*.data setlocal syntax=gmpl

au FileType c,h,java,js setlocal mps+==:;   " allow the match pairs operation (%) to work with '=' and ';'
au FileType c,h         setlocal cindent    " enable the intelligent cindent (cin) feature for the following files
au FileType java,js setlocal smartindent                    " enable the smartindenting (si) feature for the following files


" when opening a file, jump to the last known cursor position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
  \ endif

"au FileType python          setlocal omnifunc=pythoncomplete#Complete
au FileType python          setlocal omnifunc=jedi#completions
au Filetype html,markdown   setlocal omnifunc=htmlcomplete#CompleteTags
au Filetype css             setlocal omnifunc=csscomplete#CompleteCSS
au Filetype javascript      setlocal omnifunc=javascriptcomplete#CompleteJS
au Filetype c               setlocal omnifunc=ccomplete#Complete
au Filetype php             setlocal omnifunc=phpcomplete#CompletePHP
au Filetype ruby            setlocal omnifunc=rubycomplete#Complete
au Filetype sql             setlocal omnifunc=sqlcomplete#Complete
au Filetype xml             setlocal omnifunc=xmlcomplete#CompleteTags

"Surligne les espaces de fin de ligne
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Delete trailing white space
"autocmd BufWritePre * :%s/\s\+$//e
"autocmd BufWritePre *.py :%s/\s\+$//e
function! DeleteTrailingWS()
  execute "normal mz"
  %s/\s\+$//ge
  execute "normal `z"
endfunc

" Delete trailing white space on save for some specific files
au FileType c,cpp,python,prolog,tex au BufWrite * :call DeleteTrailingWS()

"}}}

""""""""""""""""""""{{{ VIM MODES DISPLAY and SETTINGS

" Highlight long lines
"au FileType python,c let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
au FileType python,c let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

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

""""""""""""""""""""{{{ ABBREVIATIONS

:autocmd FileType python     :iabbrev <buffer> iff if:<left>
:autocmd FileType c          :iabbrev <buffer> #i #include
:autocmd FileType c          :iabbrev <buffer> #d #define
:autocmd FileType html       :iabbrev <buffer> <a <a href=""></a><left><left><left><left><left>
:autocmd FileType html       :iabbrev <buffer> <i <img src="" /><left><left><left>
:autocmd FileType php        :iabbrev <buffer> <i <img src="" /><left><left><left>
:autocmd FileType javascript :iabbrev <buffer> <? <?php?><left><left>

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


""""""""""""""""""""{{{ PLUGINS

""" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_theme = 'badwolf'
let g:airline_theme = 'powerlineish'

""" Map for NerdCommenter
"use defaut mapping: <leader>c<space> to toggle comments both normal and visual)

""" NerdTree
let NERDChristmasTree = 1
let NERDTreeSortOrder = ['\/$', '\.py$', '\.cpp$', '\.c$', '\.hpp$', '\.h$', '*']

""" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

""" Signify (Sy)
" highlight signs in Signify (Sy)
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=160
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" highlight lines in Signify (Sy) and vimdiff etc.
" TODO -- - fix molokai on this (open) issue ?
"highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
"highlight DiffDelete        cterm=bold ctermbg=none ctermfg=160
"highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
"highlight DiffText          cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

""" NeoComplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Help the key mapping
function! s:my_cr_function()
  "return neocomplete#close_popup()."\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" Plugin key-mappings.
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? neocomplete#close_popup() : "\<TAB>"

""" Jedi completion module
"let g:jedi#auto_initialization = 1
"let g:jedi#auto_vim_configuration = 1
"let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#use_splits_not_buffers = "left"
""This options could be "left", "right", "top" or "bottom". It will decide the direction where the split open.

""Jedi automatically starts the completion, if you type a dot, e.g. str., if you don't want this:
let g:jedi#popup_on_dot = 0
"" 'light' popup display (disable function call signature)
"let g:jedi#show_call_signatures = "0"
""Jedi selects the first line of the completion menu: for a better typing-flow and usually saves one keypress.
"let g:jedi#popup_select_first = 0
"" If one does not want the jedi completion but still enable other features
"let g:jedi#completions_enabled = 0


"}}}

""""""""""""""""""""{{{ KEYBINDINGS (includings plugins) AND ALIAS
" Default (choose one, comment other)
source ~/.vim/vimrc.bepo
au filetype rst execute "source ~/.vim/alias/bepo/rst.vim"
au filetype tex execute "source ~/.vim/alias/bepo/tex.vim"

"source ~/.vim/vimrc.qwerty
"au filetype rst execute "source ~/.vim/alias/qwerty/rst.vim"
"au filetype tex execute "source ~/.vim/alias/qwerty/tex.vim"

"}}}


""""""""""""""""""""{{{ TODO Minimap
" TODO: link with easymotion !
"command! Minimap call minimap#ShowMinimap()
"nnoremap m :Minimap<CR>

