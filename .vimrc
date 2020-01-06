syntax on

set background=dark

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set nu
set ruler
set colorcolumn=80
set cursorline

" Automatically read changes to file
set autoread

" Search by lower case unless query contains upper case
set ignorecase
set smartcase

" Show leading whitespace that includes spaces, and trailing whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Store backupfiles somehwere sensible
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

" Intsall and configure plugins
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'valloric/youcompleteme'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug '907th/vim-auto-save'
Plug 'preservim/nerdtree'
Plug 'wkentaro-archive/conque.vim'

call plug#end()

" ymc config
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" lightline config
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'git-branch' ] ]
      \ },
      \ 'component': {
      \   'git-branch': '%{FugitiveStatusline()}'
      \ },
      \ }

" vim-gitgutter config
highlight GitGutterAdd    guifg=#009900 guibg=<X> ctermfg=2
highlight GitGutterChange guifg=#bbbb00 guibg=<X> ctermfg=3
highlight GitGutterDelete guifg=#ff2222 guibg=<X> ctermfg=1

" vim-auto-save config
let g:auto_save = 1  " enable AutoSave on Vim startup

" nerdtree config
autocmd vimenter * NERDTree
