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
Plug 'tpope/vim-sensible' "A universal set of defaults that (hopefully) everyone can agree on.
Plug 'ctrlpvim/ctrlp.vim' "Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'godlygeek/tabular' "Vim script for text filtering and alignment
Plug 'vim-airline/vim-airline' "Lean & mean status/tabline for vim that's light as air.
Plug 'airblade/vim-gitgutter' "A Vim plugin which shows a git diff in the 'gutter' (sign column). It shows which lines have been added, modified, or removed. 
Plug 'jacoborus/tender' " Color theme
Plug 'flazz/vim-colorschemes' " http://vimcolors.com/?utf8=%E2%9C%93&bg=dark&colors=term&order=newest&page=3
Plug 'RRethy/vim-illuminate' " highlights the words in the current buffer matching the one under the cursor
Plug 'yggdroot/indentline' "This plugin is used for displaying thin vertical lines at each indentation level 
Plug 'w0rp/ale' "ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim 0.2.0+ and Vim 8 while you edit your text files 
Plug 'farmergreg/vim-lastplace' " Intelligently reopen files at your last edit position.
Plug 'takac/vim-hardtime' " Hardtime helps you break that annoying habit vimmers have of scrolling up and down the page using jjjjj and kkkkk but without compromising the rest of our vim experience. 

"Completion
Plug 'ajh17/VimCompletesMe' " A super simple, super minimal, super light-weight tab-completion plugin for Vim.
Plug 'ervandew/supertab' "Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs
Plug 'Shougo/deoplete.nvim' " Dark powered asynchronous completion framework for neovim/Vim8
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc' " Requires pip install neovim
Plug 'SirVer/ultisnips' " Code snippiets
Plug 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them

call plug#end()

" Completion
let g:UltiSnipsExpandTrigger="<tab>"
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 50) " Default 200

" takac/vim-hardtime
" use :HardTimeToggle toggle it on an off
let g:hardtime_default_on = 0
let g:hardtime_showmsg = 1

" RRethy/vim-illuminate
" you can output all groups currently active using a script that comes with Vim. Running :so
" $VIMRUNTIME/syntax/hitest.vim will show something 
hi link illuminatedWord TabLine
let g:Illuminate_delay = 250 " Default 250 ms

" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=100          " How many undos
set undoreload=10000        " number of lines to save for undo

" Colors
set t_Co=256
set background=dark
colorscheme tender
let g:airline_theme = 'tender'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if (has("termguicolors"))
    set termguicolors
endif
set t_BE= "Avoid 0~ and 1~ when copy pasting

" Folding
"setlocal foldmethod=syntax
"setlocal foldmethod=manual
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" vnoremap <Space> zf

" Toggle pasting mode on and off
set pastetoggle=<F3>
let g:airline#extensions#tabline#enabled = 1
syntax enable

" Reformat JSON using pythons json tool
nmap =j :%!python -c "import json, sys, collections; print(json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), indent=2))"<CR>

" ctrlpvim/ctrlp.vim
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
map <S-F8> :Tabularize /;\zs<cr>i
" Python list of strings 
map <S-F9> :Tabularize /',\zs<cr>


" Move between tabs
set tabpagemax=50
map <F8> :tabp<cr>
map <F9> :tabn<cr>

" Code linting
" https://lintlyci.github.io/Flake8Rules/
" [E128] Continuation line under-indented for visual indent
" [E221] multiple spaces before operator
" [E265] block comment should start with '# '
" [E501] Line too long (82 &gt; 79 characters)
" [E241] Multiple spaces after ':'
" [W503] Line break occurred before a binary operator
let b:ale_linters = {'python': ['flake8']}  "Remove this line to enable other linters as pylint, but this is slower
let g:ale_python_flake8_options="--ignore=E128,E221,E265,E501,E241,W503" " https://lintlyci.github.io/Flake8Rules/
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Remove trailing whitespaces from all lines
nnoremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <F5> :w<CR> :! ./%<CR>
command! Q  quit
command! W  write
command! Wq wq
" SUDO - write the file using sudo rights
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Make search more bright
highlight Search term=standout ctermfg=3 cterm=standout
highlight Visual term=standout ctermfg=4 cterm=standout

" It seems Highlight_Matching_Pair is quite slow the following can help with this
" set lazyredraw
if v:version >= 801
    " Realative numbers are cool, but very slow in version 8.0. Fixed in 8.1
    set number relativenumber
    " Toggle line numbers from none at all
    " to relative numbering with current line number
    noremap <F2> :set invnumber invrelativenumber<CR>
endif

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
filetype plugin indent on
autocmd BufRead,BufNewFile *.tex set spell
autocmd BufRead,BufNewFile *.md set spell
autocmd BufRead,BufNewFile *.txt set spell
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
let g:myLangList = ["nospell", "en_us", "da"]
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
