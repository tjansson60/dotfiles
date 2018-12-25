" Thomas Jansson 2018

" VIM PLUG SETUP and some downloads, see http://vimawesome.com/
" Consider installing the following:
"   sudo apt install curl vim exuberant-ctags git ack-grep pep8 flake8 pyflakes isort
"   sudo pip install pep8 flake8 pyflakes isort yapf build-essential cmake

" The following lines should be added to ~/.config/nvim/init.vim to make neovim read this config file
" set runtimepath^=/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vim/vimrc

if has('nvim')
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    	autocmd VimEnter * PlugInstall | source $MYVIMRC
    endif
    call plug#begin('~/.vim/plugged')
else
    if empty(glob('~/.vim/autoload/plug.vim'))
    	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    	autocmd VimEnter * PlugInstall | source $MYVIMRC
    endif
    call plug#begin()
endif

Plug 'lilydjwg/colorizer' "Colorize HEX codes
Plug 'RRethy/vim-illuminate' " highlights the words in the current buffer matching the one under the cursor
Plug 'tpope/vim-sensible'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jacoborus/tender' " Color
Plug 'flazz/vim-colorschemes' " http://vimcolors.com/?utf8=%E2%9C%93&bg=dark&colors=term&order=newest&page=3
"Plug 'ambv/black' " Python code linter/formatter, usage :Black
"
hi link illuminatedWord Visual

" You complete me need custom compiled vim on some systems and installing the plugin it needs to be compiled.
" Plug 'valloric/youcompleteme'
"In the folder .vim/plugged/youcompleteme run the command ./install.py
"let g:ycm_python_binary_path = '/usr/bin/python3'
" let g:ycm_python_binary_path = '/home/tjansson/anaconda3/bin/python'

" Plug 'davidhalter/jedi-vim' " nice but slow
" let g:pymode_rope_lookup_project = 0
" let g:pymode_rope_complete_on_dot = 0
" let g:pymode_rope = 0

" Plug 'python-mode/python-mode'

Plug 'sirver/ultisnips'
" Read https://github.com/honza/vim-snippets/blob/master/UltiSnips/tex.snippets
" Read https://github.com/honza/vim-snippets/blob/master/UltiSnips/python.snippets
call plug#end()

" Colors
"let g:rehash256 = 1
"let g:solarized_termcolors=256
"set t_Co=256
set background=dark
colorscheme tender
let g:airline_theme = 'tender'
if (has("termguicolors"))
    set termguicolors
endif
set t_BE= "Avoid 0~ and 1~ when copy pasting

" Folding
" set nofoldenable " Enabled from youcompleteme 
setlocal foldmethod=syntax
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Setup plugins settings
set number relativenumber " Turn line numbering on at startup
" Toggle line numbers from none at all
" " to relative numbering with current line number
noremap <F2> :set invnumber invrelativenumber<CR>
setlocal foldmethod=manual
let g:airline#extensions#tabline#enabled = 1
syntax enable
syntax on
let python_highlight_all=1

"JEDI -  Remember to have a working PYTHONPATH
"let g:jedi#use_tabs_not_buffers = 1

" Reformat JSON using pythons json tool
nmap =j :%!python -c "import json, sys, collections; print(json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), indent=2))"<CR>

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ultisnips_python_style=0x3

noremap <C-l> :CtrlP ../<CR>
noremap <C-x> :CtrlP ~/code<CR>
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

"Only tabularize the first =
map <S-F5> :Tabularize /^[^=]*\zs=<cr>
"Align all the , in alist of dicts or tupples
map <S-F6> :Tabularize /,\zs<cr>
"Tabularize elements of a dict
map <S-F7> :Tabularize /:\zs<cr>
"Tabularize elements of a CSV
map <S-F8> :Tabularize /;\zs<cr>

" SUDO - write the file using sudo rights
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!


set tabpagemax=50
" Move between tabs
map <F8> :tabp<cr>
map <F9> :tabn<cr>

" NERDtree
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:python_version_2 = 1

" Syntastic - https://lintlyci.github.io/Flake8Rules/
let g:syntastic_python_checkers = ['flake8']
" [E221] multiple spaces before operator
" [E128] Continuation line under-indented for visual indent
" [E221] multiple spaces before operator
" [E265] block comment should start with '# '
" [E501] Line too long (82 &gt; 79 characters)
" [E241] Multiple spaces after ':'
let g:syntastic_python_flake8_args="--ignore=E128,E221,E265,E501,E241"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_quiet_messages = { "type": "style" }

" Remove trailing whitespaces from all lines
nnoremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <F5> :w<CR> :! ./%<CR>
command! Q  quit
command! W  write
command! Wq wq

highlight Search term=standout ctermfg=3 cterm=standout
highlight Visual term=standout ctermfg=4 cterm=standout
if v:version > 74338
    set breakindent
endif
set hlsearch
set backspace+=start,eol,indent
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp
set expandtab
set ignorecase
set noerrorbells
set novisualbell
set nowrap
set shiftwidth=4
set showmatch
set smartcase
set smarttab
set softtabstop=4
set tabstop=4
set textwidth=0
set virtualedit=all
set wildignore=*.swp,*.bak,*.pyc,*.class
set ttyfast
set textwidth=120 " Not quite PEP8, but more readable on modern machines.
set formatoptions-=t " Keeps the visual textwidth but doesn't add new line in insert mode.
set colorcolumn=120

"" Filetypes
"filetype on
"filetype plugin on
"filetype indent on
filetype plugin indent on
autocmd BufRead,BufNewFile *.tex set spell
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us

" Spell checker
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline ctermfg=1 cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline ctermfg=1 cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline ctermfg=1 cterm=underline

"switch spellcheck languages
let g:myLang = 0
let g:myLangList = [ "nospell", "en_us", "da" ]
function! MySpellLang()  "loop through languages
  let g:myLang = g:myLang + 1
  if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
  if g:myLang == 0 | set nospell | endif
  if g:myLang == 1 | setlocal spell spelllang=en_us | endif
  if g:myLang == 2 | setlocal spell spelllang=da | endif
  echo "language:" g:myLangList[g:myLang]
endf
map <F6> :call MySpellLang()<CR>
imap <F6> <C-o>:call MySpellLang()<CR>

" Tell vim to remember certain things when we exit, see http://vim.wikia.com/wiki/VimTip80
if has('nvim')
    set viminfo='20,\"300,:20,%,n~/.nviminfo
else
    set viminfo='20,\"300,:20,%,n~/.viminfo
endif

" when we reload, tell vim to restore the cursor to the saved position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
