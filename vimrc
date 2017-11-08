set nocompatible

set ambiwidth=double
set autoindent
set backspace=indent,eol,start
set cmdheight=1
set colorcolumn=80
set copyindent
set cursorline
set encoding=utf-8
set expandtab
set fileformats=unix
set fileencodings=ucs-bom,utf-8,iso-2022-jp,iso-2022-jp-3,sjis,cp932,euc-jp,eucjp-ms,euc-jisx0213,cp20932
set formatexpr=autofmt#japanese#formatexpr()
set formatoptions+=mM
set helplang=ja,en
set laststatus=2
set list
set listchars=tab:>-,trail:-
set number
set ruler
set scroll=15
set shiftwidth=2
set showcmd
set smartindent
set smarttab
set splitright
set tabstop=4
set virtualedit+=block
set whichwrap=b,s,[,],<,>

scriptencoding utf-8
syntax enable
filetype plugin indent on

set background=dark

execute pathogen#infect()

hi ColorColumn ctermfg=lightgrey ctermbg=black

" IM control on fcitx
if $XMODIFIERS == "@im=fcitx"
  "##### auto fcitx  ###########
  let g:input_toggle = 0
  function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
    endif
  endfunction

  function! Fcitx2zh()
    let s:input_status = system("fcitx-remote")
    if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
    endif
  endfunction

  "set timeout timeoutlen=3000 ttimeoutlen=100
  set timeout
  set timeoutlen=500
  set ttimeout
  set ttimeoutlen=100
  " Leave insert-mode
  autocmd InsertLeave * call Fcitx2en()
  " Enter insert-mode
  autocmd InsertEnter * call Fcitx2zh()
  "##### auto fcitx end ######
endif
