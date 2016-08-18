" Force fileformat to unix and encodings to utf-8
set ff=unix
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set columns=86 lines=30
set nocompatible
set wrap
set ambiwidth=double
set smartindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2
set mouse=a
set nu
set ruler
set wildmenu
set mouseshape=n:beam
set hls
set foldmethod=indent
set foldlevel=99
syntax on
source $VIMRUNTIME/mswin.vim
behave mswin

let mapleader=","

"TagList
let Tlist_Auto_Highlight_Tag=1
let Tlist_Auto_Open=1
let Tlist_Auto_Update=1
let Tlist_Display_Tag_Scope=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Enable_Dold_Column=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1
let Tlist_Use_SingleClick=1
nnoremap <silent> <F8> :TlistToggle<CR>

" shortcuts for vundle functions
map <leader>l <ESC>:PluginList<CR>
map <leader>i <ESC>:PluginInstall<CR>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

filetype plugin indent on

set completeopt=longest,menu
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
let g:pydiction_location = '~\vimfiles\bundle\pydiction\complete-dict'

colorscheme molokai
autocmd FileType python set colorcolumn=79 | set textwidth=99
au BufRead,BufNewFile *.py, *.less, *.css, *.js, *.html set fileformat=unix

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
autocmd BufNewFile,BufReadPost *.js setl shiftwidth=2 expandtab
autocmd BufNewFile,BufReadPost *.jsx setl shiftwidth=2 expandtab
autocmd BufNewFile,BufReadPost *.css setl shiftwidth=2 expandtab
autocmd BufNewFile,BufReadPost *.sass setl shiftwidth=2 expandtab
autocmd BufNewFile,BufReadPost *.scss setl shiftwidth=2 expandtab
autocmd BufNewFile,BufReadPost *.less setl shiftwidth=2 expandtab

set laststatus=2
let g:airline_section_b = '%{&ff}%   %{&fileencoding?&fileencoding:&encoding}'

set rtp+=~/vimfiles/bundle/Vundle.vim
let path='~/vimfiles/bundle'
call vundle#begin(path)
Plugin 'gmarik/Vundle.vim'
Plugin 'taglist.vim'
Plugin 'rkulla/pydiction'
Plugin 'andviro/flake8-vim'
Plugin 'bling/vim-airline'
Plugin 'joonty/vim-phpqa'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'groenewege/vim-less'
Plugin 'skammer/vim-css-color.git'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'scrooloose/syntastic'
call vundle#end()

let g:phpqa_codesniffer_args = "--standard=Zend"
let g:phpqa_codesniffer_autorun = 1
let g:phpqa_messdetector_ruleset = ''
let g:phpqa_messdetector_autorun = 0

" nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" Flake8 autofix
map <F6> :PyFlakeAuto<CR>
" StripWhitespace
map <F7> :StripWhitespace<CR>
autocmd FileType python,html,javascript,css autocmd BufWritePre <buffer> StripWhitespace

au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.jsx set filetype=javascript

" syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_css_checkers = ['stylelint']
