" Force fileformat to unix and encodings to utf-8
set ff=unix
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set columns=120 lines=30
set linespace=5
set nocompatible
set wrap
set nowritebackup
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
set clipboard=unnamed
set cursorline
syntax on

let mapleader=","

" Shortcuts for vundle functions
map <leader>l <ESC>:PluginList<CR>
map <leader>i <ESC>:PluginInstall<CR>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" You dont need jj
inoremap jj <esc>

filetype plugin indent on

set completeopt=longest,menu
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

colorscheme monokai
set background=dark

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Menlo\ Regular:h15
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h15
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
else
  set background=dark
endif

autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd BufNewFile,BufReadPost *.coffee,*js,*.jsx,*.css,*.sass,*.scss,*.less,*.html setl shiftwidth=2 expandtab

set laststatus=2
let g:airline_section_b = '%{&ff}%   %{&fileencoding?&fileencoding:&encoding}'

set rtp+=~/.vim/bundle/Vundle.vim
let path='~/.vim/bundle'
call vundle#begin(path)
"------- Code/Project navigator -------
Plugin 'preservim/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'

"-------- Snippets ---------------------
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'

"-------- Languages support ------------
Plugin 'tpope/vim-commentary'
Plugin 'mitsuhiko/vim-sparkup'
Plugin 'Rykka/riv.vim'
Plugin 'Valloric/YouCompleteMe'

"-------- Python  -----------------------
Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'

"-------- Golang  -----------------------
Plugin 'fatih/vim-go'

"-------- HTML/CSS  ---------------------
Plugin 'mattn/emmet-vim'
Plugin 'groenewege/vim-less'
Plugin 'skammer/vim-css-color.git'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mxw/vim-jsx'

"-------- Other  ------------------------
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/powerline'
Plugin 'fisadev/FixedTaskList.vim'
Plugin 'rosenfeld/conque-term'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'skywind3000/asyncrun.vim'

call vundle#end()

" Tabs / Buffers settings
tab sball
set switchbuf=useopen
set laststatus=2
nmap <leader>t :TagbarToggle<CR>
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

" Search settings
set ignorecase
set smartcase
set incsearch
set hlsearch

" AirLine settings
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=0

" TagBar settings
let g:tagbar_autofocus=0
let g:tagbar_width=42
"autocmd BufEnter *.py,*.go :call tagbar#autoopen(0)

" NERDTree settings
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']
autocmd vimenter * NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" SnipMate settings
let g:snippets_dir='~/.vim/vim-snippets/snippets'

" Riv.vim settings
let g:riv_disable_folding=1

" Python settings

" python executables for different plugins
let g:pymode_python='python3'
let g:syntastic_python_python_exec='python3'

" rope
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0

" documentation
let g:pymode_doc=0
let g:pymode_doc_bind='K'

" lints
let g:pymode_lint=0

" virtualenv
let g:pymode_virtualenv=1

" breakpoints
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all

autocmd FileType python set colorcolumn=79 | set textwidth=180

" code folding
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F6>'

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=5
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='x'
let g:syntastic_style_warning_symbol='x'
let g:syntastic_python_checkers=['flake8', 'pydocstyle', 'python']

" YouCompleteMe
set completeopt-=preview

let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0

nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>

" StripWhitespace
nnoremap <F7> :StripWhitespace<CR>
autocmd FileType html,javascript,css,py,go autocmd BufWritePre <buffer> StripWhitespace

au BufNewFile,BufRead *.jsx set filetype=javascript
au BufNewFile,BufRead *.less set filetype=less

" map :W to :w
:command WQ wq
:command Wq wq
:command W w
:command Q q

" disable recording
map q <Nop>

" emmet-vim
" for ReactJS support
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" ale
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" Quick run via <F5>
nnoremap <F5> :call <SID>compile_and_run()<CR>

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python %"
    endif
endfunction

" auto prettify js
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" Vim-go
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt"

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Run/build/test/coverage
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Tagbar
nmap <F8> :TagbarToggle<CR>
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
