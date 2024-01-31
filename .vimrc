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

"# Setup python enviroment
let g:python_host_prog = '~/miniconda3/bin/python'
let g:python3_host_prog = '~/miniconda3/bin/python'

" General
Plug 'tpope/vim-sensible' "A universal set of defaults that (hopefully) everyone can agree on.
Plug 'ctrlpvim/ctrlp.vim' "Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'godlygeek/tabular' "Vim script for text filtering and alignment, TODO: consider vim-easy-align
Plug 'vim-airline/vim-airline' "Lean & mean status/tabline for vim that's light as air.
Plug 'airblade/vim-gitgutter' "A Vim plugin which shows a git diff in the 'gutter' (sign column). It shows which lines have been added, modified, or removed.
Plug 'zivyangll/git-blame.vim' " See Git Blame information in the status bar for the currently selected line, Leader +s
Plug 'dense-analysis/ale' "ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim 0.2.0+ and Vim 8 while you edit your text files
Plug 'farmergreg/vim-lastplace' " Intelligently reopen files at your last edit position.
Plug 'takac/vim-hardtime' " Hardtime helps you break that annoying habit vimmers have of scrolling up and down the page using jjjjj and kkkkk but without compromising the rest of our vim experience.
Plug 'shmup/vim-sql-syntax' " SQL syntax checker
Plug 'tpope/vim-commentary' " Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the target
" Plug 'amdt/vim-niji'  " Niji (Rainbow) is yet another rainbow parentheses plugin for Vim.
" Plug 'davidhalter/jedi-vim' " jedi-vim is a VIM binding to the autocompletion library Jedi. But it is soooo slow.
Plug 'ambv/black'  " Black is the uncompromising Python code formatter. rm -rf ~/.vim/black and sudo apt-get install python3-venv

" Colors and highlighting
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim.
Plug 'lilydjwg/colorizer' "Colorize HEX codes
Plug 'hzchirs/vim-material' " Color theme, https://github.com/hzchirs/vim-material
Plug 'RRethy/vim-illuminate' " highlights the words in the current buffer matching the one under the cursor
Plug 'yggdroot/indentline' "This plugin is used for displaying thin vertical lines at each indentation level
" Plug 'sainnhe/gruvbox-material' " Easy on the eyes colorscheme
" Plug 'morhetz/gruvbox' " Original gruvbox
" Plug 'flazz/vim-colorschemes' " http://vimcolors.com/?utf8=%E2%9C%93&bg=dark&colors=term&order=newest&page=3
" Plug 'jacoborus/tender' " Color theme

"Completion
"Plug 'maralla/completor.vim' " Completor is an asynchronous code completion framework for vim8.
"Plug 'ajh17/VimCompletesMe' " A super simple, super minimal, super light-weight tab-completion plugin for Vim.
Plug 'ervandew/supertab' "Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs
Plug 'SirVer/ultisnips' " Code snippiets
Plug 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them
call plug#end()

" Tips from the article: Learn vim For the Last Time: A Tutorial and Primer
" https://danielmiessler.com/study/vim/
inoremap jk <ESC>
let mapleader = " " " remap the leader key to space
set clipboard=unnamedplus

" Set up supertab to use jedi-vim
let g:SuperTabDefaultCompletionType = "context"

" Set the terminal title
set title

" Completion
let g:UltiSnipsExpandTrigger="<tab>"
let g:completor_complete_options = 'menuone,noselect,preview'

" Indentline conceals certain characters which is very annoying. g:indentLine_setConceal = 0 disables this, but kills
" indentline, so instead this disable indentline for certain filetypes:
let g:indentLine_fileTypeExclude = ['haskell', 'json', 'yaml', 'markdown', 'text', 'sh', 'vim']
let g:indentLine_conceallevel = 1 " may or may not be required
let g:indentLine_setConceal = 1

" Black
let g:black_linelength = 120
" autocmd BufWritePost *.py execute ':Black'

" takac/vim-hardtime
" use :HardTimeToggle toggle it on an off
let g:hardtime_default_on = 0
let g:hardtime_showmsg = 1

" RRethy/vim-illuminate
" you can output all groups currently active using a script that comes with Vim. Running :so
" $VIMRUNTIME/syntax/hitest.vim will show something
" hi link illuminatedWord TabLine
" hi link illuminatedWord Visual
let g:Illuminate_delay = 250 " Default 250 ms

" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=100          " How many undos
set undoreload=10000        " number of lines to save for undo

" Colors
set t_Co=256
set background=dark

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if (has("termguicolors"))
    set termguicolors
endif
set t_BE= "Avoid 0~ and 1~ when copy pasting
let g:airline#extensions#tabline#enabled = 1

" Dark " Oceanic
" let g:material_style='oceanic'
let g:material_terminal_italics = 1
colorscheme vim-material
let g:airline_theme='material'
highlight clear SignColumn  " Change the color of the git-gutter to same color as linenumbers
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)

" https://github.com/zivyangll/git-blame.vim
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" Changing vim’s option for updatetime from the default of 4000 to ~100 makes the gutter signs appear more responsive:
set updatetime=100

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

" Folding
setlocal foldmethod=syntax
set foldlevelstart=99
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" vnoremap <Space> zf
function! ToogleFold()
    if &foldlevel >= 20
		"Folds all
        normal! zM<CR>
        set foldlevel=0
    else
		" Uunfolds everything
        normal! zR<CR>
        set foldlevel=20
    endif
endfunction

" Toggle code folding on and off
nnoremap <F10> :call ToogleFold()<CR>

" Move between tabs
set tabpagemax=50

" Code linting
" https://lintlyci.github.io/Flake8Rules/
" E128, # Continuation line under-indented for visual indent
" E201, # Whitespace after [. Reason for exclusion: reduces readability of repeated elements of similar lines
" E221, # Multiple spaces before operator
" E222, # Multiple spaces after operator. Reason for exclusion: increasing readability of repeated elements of similar lines
" E241, # Multiple spaces after ':'
" E251, # Unexpected spaces around keyword / parameter equals
" E272, # Multiple spaces before keyword. Reason for exclusion: reduces readability of repeated elements of similar lines
" E501, # Line too long (82 > 79 characters). Reason for exclusion: reduces readability on modern screens
" W503 # Line break occurred before a binary operator
let b:ale_linters = {'python': ['flake8']}  "Remove this line to enable other linters as pylint, but this is slower
let g:ale_python_flake8_options="--ignore=E128,E201,E221,E222,E241,E251,E272,E501,W503,E203" " https://lintlyci.github.io/Flake8Rules/, E203 removed due to Black https://github.com/psf/black/issues/315
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

command! Q  quit
command! W  write
command! Wq wq
" SUDO - write the file using sudo rights
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!


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

" Disables Vim's TeX plugin usage of "conceal"
let g:tex_conceal = ""

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

""""""""""""""""""""""
" Hot keys
""""""""""""""""""""""
" It seems Highlight_Matching_Pair is quite slow the following can help with this
" set lazyredraw
if v:version >= 801
    " Realative numbers are cool, but very slow in version 8.0. Fixed in 8.1
    set number relativenumber
    " Toogles all the decorators on the line on and off, so it easy to copy pase to and from the terminal
    noremap <F2> :set invnumber invrelativenumber <bar> :IndentLinesToggle<CR> <bar> :GitGutterToggle<CR> <bar> :ALEToggle<CR>
endif

" Toggle pasting mode on and off
set pastetoggle=<F3>

" Remove trailing whitespaces from all lines
nnoremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Execute the file
nmap <F5> :w<CR> :! ./%<CR>

map <F6> :call MySpellLang()<CR>
imap <F6> <C-o>:call MySpellLang()<CR>

" Move between tabs
map <F8> :tabp<cr>
map <F9> :tabn<cr>


""""""""""""""""""""""
" Hot keys, SHIFT
""""""""""""""""""""""
"vim -p `grep -il sid *`
" map <S-F3> : execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

"Only tabularize the first =
map <S-F5> :Tabularize /^[^=]*\zs=<cr>
"Align all the , in alist of dicts or tupples
map <S-F6> :Tabularize /,\zs<cr>
"Tabularize elements of a dict
map <S-F7> :Tabularize /:\zs<cr>
"Tabularize elements of a CSV
map <S-F8> :Tabularize /;\zs<cr>
" Python list of strings
map <S-F9> :Tabularize /',\zs<cr>
