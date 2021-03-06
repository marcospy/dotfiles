call plug#begin()
" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" File type icons
Plug 'ryanoasis/vim-devicons'

" EasyMotion
Plug 'easymotion/vim-easymotion'

" local vimrc
Plug 'MarcWeber/vim-addon-local-vimrc'

" Airline - bottom status line
Plug 'vim-airline/vim-airline'

" Vim surround - parentheses closing
Plug 'tpope/vim-surround'

" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

" File search
Plug 'kien/ctrlp.vim'

" Text search
Plug 'rking/ag.vim'

" Vim gitgutter
Plug 'airblade/vim-gitgutter'

" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Themes
Plug 'mhartington/oceanic-next'
Plug 'flazz/vim-colorschemes'

" Code completion/generation
Plug 'valloric/youcompleteme'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript.jsx', 'vue'] }

" ctags update
Plug 'craigemery/vim-autotag'

" Better Whitespaces
Plug 'ntpeters/vim-better-whitespace'

" Syntax highlighting
Plug 'slim-template/vim-slim', { 'for': ['slim'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html', 'vue'] }
Plug 'elixir-editors/vim-elixir'
Plug 'vim-scripts/groovy.vim'
Plug 'ap/vim-css-color'
Plug 'posva/vim-vue'
Plug 'b4b4r07/vim-hcl'

" Syntax checking
Plug 'scrooloose/syntastic'

" Commenting
Plug 'tomtom/tcomment_vim'

" Rubocop
Plug 'ngmy/vim-rubocop'
call plug#end()

" General settings
set title                                     " Change terminal title
set relativenumber number                     " Show line number
set history=500                               " :cmdline history size
set showcmd                                   " Show completions for cmds
set noshowmode                                " Hide mode because airline shows it
set gcr=a:blinkon500-blinkwait500-blinkoff500 " Set cursor blinking rate
set cursorline                                " Highlight current line
set smartcase                                 " Smart case search if there is uppercase
set ignorecase                                " Case insensitive search
set mouse=a                                   " Enable mouse interaction
set showmatch                                 " Highligh matching bracket
set nostartofline                             " Jump to non-blank char
set timeoutlen=1000 ttimeoutlen=0             " Reduce Command timeout for faster escape and O
set fileencoding=utf-8                        " Set utf-8 encoding on write
set wrap                                      " Enable word wrap
set linebreak                                 " Wrap lines at convenient points
set listchars=tab:»\ ,space:·                 " Set representation for whitespaces
set list                                      " Enable listchars
set tags=.tags                                " Tags files
set autoread                                  " Reload file when changed outside vim
set termguicolors                             " Enable terminal true colors
set encoding=UTF-8                            " Encoding UTF-8
syntax enable                                 " Turn on sintax highlighting
colorscheme tender                            " Set theme

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Persistent undo
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" Indentation settings
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set colorcolumn=120

" Code folding
set foldmethod=syntax
set foldnestmax=10
set foldlevel=2
set nofoldenable

" Disable macro recording
map q <Nop>

" Auto commands
augroup vimrc
  autocmd!
augroup END

autocmd vimrc BufWritePre * :StripWhitespace   " Remove trailing whitespaces
autocmd vimrc InsertEnter * :set nocul         " Remove cursorline highlight on insert mode enter
autocmd vimrc InsertLeave * :set cul           " Add current line highlighting on insert mode leave
autocmd vimrc FocusGained,BufEnter * checktime " Refresh file when vim gets focus
autocmd BufEnter * :syntax sync fromstart      " Redo syntax highlighting

" Leader remapping
let mapleader = '\'

" Ag settings
map <Leader>s :Ag<Space>

" NERDTree settings
let NERDTreeWinPos = 'left'
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>a :NERDTreeFind<CR>

" Search
nnoremap <Leader>f /

" Hide search highlighting
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Copy and paste from/to system clipboard
vnoremap <C-c> "+y
inoremap <C-v> <Esc>"+pa

" Move selected lines up and down
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '>-2<CR>gv=gv

" Delete line on insert mode
inoremap <C-d> <esc>ddi

" Tabs in normal and visual mode
nnoremap <tab> >>
nnoremap <s-tab> <<

" Tabs in visual mode
xnoremap <tab> >gv
xnoremap <s-tab> <gv

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

" Move between panes
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Block movements on normalmode
map <up> <NOP>
map <down> <NOP>
map <left> <NOP>
map <right> <NOP>

" Set current user as owner of the current file
cnoremap r!! execute 'silent! !sudo chown `whoami`:`whoami` %' <Bar> edit!<CR>


" Plugins settings

" Ag
let g:ag_prg='ag -S --nocolor --nogroup --column --ignore "./node_modules/*" --ignore "./log/*"'

" vim-gitgutter
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" AutoTag
let g:autotagTagsFile=".tags"

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](node_modules|git|tmp|log|build)|(\.(swp|ico|git|svn))$'
let g:ctrlp_max_files=0

" IndentGuide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Emmet
" expand expression on tab
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Vim rubocop
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop --auto-correct<CR>
