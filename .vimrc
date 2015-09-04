colorscheme vividchalk

autocmd BufWritePre * :%s/\s\+$//e

"  remove trailing whitespace
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe normal! g'\"" | endif
endif

set number

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
