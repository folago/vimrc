set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'L9'
call vundle#end()
filetype plugin indent on
" Basic settings
"to remove hlsearch with \q
set showmatch
set history=700
set wildmenu 

set antialias
set softtabstop=4
set ruler
set cmdheight=2
"set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

"set backup dir 
set backup
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
set undodir=~/.vim/undo
set undofile

set autochdir

colorscheme desert
"colorscheme macvim " Only for MacVim
"set bg=dark

set wrap "Wrap lines
set lbr
"move normally in long wrappd lines
nnoremap k gk
nnoremap j gj
nnoremap <Down> gj
nnoremap <Up>   gk

" When I close a tab, remove the buffer
set nohidden
"status line
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%l,%c%V/%L\ %P
set statusline+=%{fugitive#statusline()}
set cursorline

"set rtp+=$GOROOT/misc/vim/
"set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
"syntax on
"filetype plugin on

"some random bindings, edit and source my .vimrc
let mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"
"vim-go settings
au FileType go nmap <Leader>d <Plug>(go-def-split)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)

"Restore cursor to file position in previous editing session
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END



"move begin end and of line
nnoremap L $
nnoremap H 0
onoremap L $
onoremap H 0
"no esc in insert mde
inoremap jk <esc>
inoremap <esc> <nop>
"no arrows for moving in normal mode
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
"no arrows for moving in insert mode
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

"spellcheck my commnets
"set spell

noremap <Leader>n :NERDTreeToggle<CR>

"tagbar stuff
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Display panel with ,y
noremap <Leader>y :TagbarToggle<CR>       
