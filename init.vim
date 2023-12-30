if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd!
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
"File Search:
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"File Browser:
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mkitt/tabline.vim'
Plug 'ryanoasis/vim-devicons'
"Color:
Plug 'morhetz/gruvbox'
"YAML Lint
Plug 'dense-analysis/ale'
Plug 'stephpy/vim-yaml'
"Golang:
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
"k8s
Plug 'andrewstuart/vim-kubernetes'
"Rego
Plug 'tsandall/vim-rego'
" Ruby
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-rbenv'
Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }
" A fuzzy file finder
Plug 'kien/ctrlp.vim'
" A cool status bar
Plug 'vim-airline/vim-airline'
" Airline themes
Plug 'vim-airline/vim-airline-themes'

" Float baby float
Plug 'voldikss/vim-floaterm'

"LSP
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Formater
Plug 'Chiel92/vim-autoformat'

Plug 'roxma/vim-hug-neovim-rpc'
"Snippets:
Plug 'SirVer/ultisnips'
"Git:
Plug 'tpope/vim-fugitive'
"Open code in gitlab/github
Plug 'ruanyl/vim-gh-line'

call plug#end()
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

let g:lightline#bufferline#enable_devicons = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:gh_gitlab_domain = "gitlab.mx.com"

"font
set guifont=DroidSansMono\ Nerd\ Font:h11
set encoding=utf8

"COPY/PASTE:
"-----------
"Increases the memory limit from 50 lines to 1000 lines
:set viminfo='100,<1000,s10,h

"NUMBERING:
"----------
:set number

"INDENTATION:
"------------
"Highlights code for multiple indents without reselecting
vnoremap < <gv
vnoremap > >gv

"COLOR:
"------
colorscheme gruvbox
let g:airline_theme='papercolor'
"toggle terminal
noremap ft  :FloatermToggle<CR>i
"AUTO IMPORT:
"------------
let g:go_fmt_command = "goimports"




"No clue
"--------

"Cycle through completion entries with tab/shift+tab
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"
"Allow getting out of pop with Down/Up arrow keys
inoremap <expr> <down> pumvisible() ? "\<C-E>" : "\<down>"
inoremap <expr> <up> pumvisible() ? "\<C-E>" : "\<up>"

"SNIPPETS:
"---------
"Change default expand since TAB is used to cycle options
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"FILE SEARCH:
"------------
"allows FZF to open by pressing CTRL-F
map <C-p> :FZF<CR>
"allow FZF to search hidden 'dot' files
let $FZF_DEFAULT_COMMAND = "find -L"
"Short cut for Ag
map ff :Ag<CR>
"FILE BROWSER:
"-------------
"allows NERDTree to open/close by typing 'n' then 't'
map nt :NERDTreeTabsToggle<CR>
map \ :NERDTreeTabsToggle<CR>
"Start NERDtree when dir is selected (e.g. "vim .") and start NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup=2
"Add a close button in the upper right for tabs
let g:tablineclosebutton=1
"Automatically find and select currently opened file in NERDTree
let g:nerdtree_tabs_autofind=1
"Add folder icon to directories
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
"Hide expand/collapse arrows
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
highlight! link NERDTreeFlags NERDTreeDir

"SHORTCUTS:
"----------
"Open file at same line last closed
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
endif

"SOURCING:
"---------
"Automatically reloads neovim configuration file on write (w)
autocmd! bufwritepost init.vim source %

"MOUSE:
"------
"Allow using mouse helpful for switching/resizing windows
set clipboard=unnamed
set mouse+=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif

"TEXT SEARCH:
"------------
"Makes Search Case Insensitive
set ignorecase

"SWAP:
"-----
set dir=~/.local/share/nvim/swap/

"GIT (FUGITIVE):
"---------------
map gb :Git blame<CR>
map gst :Git status<CR>
map gl :Git log<CR>
map gd :Git diff<CR>
map gc :Git commit<CR>
map ga :Git add %:p<CR>
map gul :Git pull<CR>
"SYNTAX HIGHLIGHTING:
"--------------------
syntax on

"HIGHLIGHTING:
"-------------
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Highlight the current line the cursor is on
set cursorline

