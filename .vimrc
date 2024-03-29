syntax on

" Yank and put from system clipboard
" https://stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-in-vim
set clipboard=unnamed

set background=dark

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set nu
" set rnu
set ruler
set colorcolumn=80
set cursorline

" Autowrap at 79 lines
" set tw=79

" Enable spell checker
set spelllang=en
" set spell

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
" Plug 'valloric/youcompleteme'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug '907th/vim-auto-save'
Plug 'preservim/nerdtree'
Plug 'wkentaro-archive/conque.vim'
Plug 'junegunn/vim-easy-align'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
Plug 'preservim/tagbar'
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

syntax enable
filetype plugin indent on

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
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" vim-auto-save config
let g:auto_save = 1  " enable AutoSave on Vim startup

" Automatically format rust code on save
let g:rustfmt_autosave = 1

" NERDTree config
" Show hidden files
let NERDTreeShowHidden=1
" Toggle with ctrl + n
map <C-n> :NERDTreeToggle<CR>

" Vim fzf
" GFiles with ctrl + f
map <C-f> :GFiles<CR>

" vim-devicons config
set encoding=UTF-8

" Syntastic recommended settings for new users
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
