colorscheme vividchalk

autocmd BufWritePre * :%s/\s\+$//e

" remove trailing whitespace
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set number

filetype plugin indent on

" On pressing tab, insert 4 spaces
set expandtab

" size of a hard tabstop
set tabstop=4

" size of an "indent"
set shiftwidth=4

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

set viminfo='10,\"100,:20,%,n~/.viminfo

if has("autocmd")
    autocmd BufReadPost *
    \ if line("\'") > 0 && line("\'") <= line("$") |
        \ exe "normal g`" |
    \ endif
endif

" go to the position I was when last editing the file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" delete trailing whitespace on write
autocmd BufWritePre *.php :%s/\s\+$//e

" delete blank lines at the end of the file
au BufWritePre * $put _ | $;?\(^\s*$\)\@!?+1,$d

set autoindent
set comments=s1:/**,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
set commentstring=/*%s*/
set complete=.,w,b,u,t,i
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
set formatoptions=croql
set hlsearch
set ignorecase
set joinspaces
set shiftround
set shiftwidth=2
set tabstop=2
set textwidth=0
syntax enable
