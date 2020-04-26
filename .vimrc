set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on                           "colored syntax
"set colorcolumn=72                 "red line @ col 72
set background=dark                 "better contrast color scheme

"the next few configure the 'crosshairs'
set cursorcolumn cursorline         
hi CursorColumn ctermbg=DarkBlue
hi CursorLine ctermbg=DarkBlue cterm=NONE

set shiftwidth=4                    "how far it auto-indents after a '{' and with >,<
set tabstop=4                       "how many spaces tabs *appear* to be
set expandtab                       "what actually converts tabs to spaces

" next few for indent-y things
set autoindent                      
set smartindent                     
set smarttab
set cindent
set ruler
"set foldmethod=syntax
"set foldlevel=0
"set foldopen=all
"set foldclose=all
:imap jk <Esc>l
:imap fj <Esc>:exec "normal f" . leavechar<CR>a
au BufWinLeave * mkview
"restart file where left off
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"au BufWinEnter * silent loadview
"the previous line conflicted with colorcolumn=72
:nnoremap <C-h> :tabprevious<CR>
:nnoremap <C-l> :tabnext<CR>
:nnoremap qq :wqa<CR>
:nnoremap <leader>O zczA

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

" Gundo
try
    if has('python3')
        let g:gundo_prefer_python3 = 1
    endif
    let g:gundo_width = 35
    let g:gundo_preview_height = 20
    let g:gundo_close_on_revert = 1
    noremap <C-g> :GundoToggle<CR>
catch
endtry
set undofile
set undodir=~/.vim/undo_history/
set history=1000
set undolevels=1000
set number

