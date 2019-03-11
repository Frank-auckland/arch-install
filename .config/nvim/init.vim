" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'                                         " CSS颜色显示
Plug 'Chiel92/vim-autoformat'                                   " 代码格式化
Plug 'honza/vim-snippets'                                       " 常用代码块集合
Plug 'Lokaltog/vim-easymotion'                                  " 快速跳转
Plug 'mhartington/oceanic-next'                                 " 颜色主题"
Plug 'majutsushi/tagbar'                                        " TagBar
Plug 'mattn/emmet-vim'                                          " Emmet神器
Plug 'neomake/neomake'                                          " 代码检错
Plug 'NLKNguyen/papercolor-theme'
Plug 'powerman/vim-plugin-AnsiEsc'                              " 显示ansi color"
Plug 'pboettch/vim-highlight-cursor-words'                      " 高亮光标单词
Plug 'Raimondi/delimitMate'                                     " 自动加括号，换行等
Plug 'scrooloose/nerdtree'                                      " 查看项目文件
Plug 'scrooloose/nerdcommenter'                                 " 注释插件
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " 自动补全神器
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'                                  " 状态栏 
Plug 'vim-airline/vim-airline-themes'                           " 状态栏主题
Plug 'vim-ctrlspace/vim-ctrlspace'                              " buffer,tab列表
Plug 'Yggdroot/indentLine'                                      " 缩进线
Plug 'zchee/deoplete-jedi'                                      " python-jedi
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }                        " shell format"

" Initialize plugin system
call plug#end()

set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set nu
syntax on
filetype on
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set expandtab
set ai!
set showmatch
set ruler
set hlsearch
set mouse=v
set hidden

"设置显示空格
set list
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:↲,nbsp:␣
"hi NonText ctermfg=16 guifg=#4a4a59
"hi SpecialKey ctermfg=16 guifg=#4a4a59

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
colorscheme OceanicNext

let mapleader = "\<Space>"
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>q :qa<CR>
nnoremap <Leader>w :w<CR>

nnoremap <silent><C-p> :CtrlSpace O<CR>

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let g:airline_solarized_bg='dark'

let g:shfmt_extra_args = '-i 2'

autocmd vimenter * NERDTree

map <F2> :NERDTreeToggle<CR>

" Quicker window movement
nnoremap <Leader>j <c-w>j
nnoremap <Leader>k <c-w>k
nnoremap <Leader>l <c-w>l
nnoremap <Leader>h <c-w>h
