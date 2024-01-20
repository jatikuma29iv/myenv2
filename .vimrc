"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
let $vimhome=fnamemodify(resolve(expand("~/.vimrc")), ':p:h')
let $vundle=$vimhome."/.vim/bundle/Vundle.vim"

syntax on
set nocompatible              " be iMproved, required
set nu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"> Vundle Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=$vundle              " set the runtime path to include Vundle and initialize
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
  "IDE
  Plugin 'preservim/nerdtree'               "Navigation
  Plugin 'preservim/nerdcommenter'          "Code Commenter
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'tpope/vim-fugitive'               "Git
  "Plugin 'jiangmiao/auto-pairs'            "Auto pairs, conflicts with
                                            "copilot
  Plugin 'junegunn/gv.vim'                  "graph view
  Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plugin 'junegunn/fzf.vim'
  "Statusline
  Plugin 'bling/vim-airline'                  " Lean & mean status/tabline for vim
  Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
  "Plugin 'itchyny/lightline.vim'
  "Theme
  Plugin 'NLKNguyen/papercolor-theme'
  "Others
  Plugin 'will133/vim-dirdiff'
  "Syntax
  Plugin 'pangloss/vim-javascript'
  Plugin 'othree/yajs.vim'                    " javascript
  Plugin 'leafgarland/typescript-vim'         " Type-script
  Plugin 'peitalin/vim-jsx-typescript'        " jsx
  Plugin 'styled-components/vim-styled-components', { 'branch': 'main'  }
  Plugin 'jparise/vim-graphql'
  " Plugin 'dense-analysis/ale'
  "Completion
  Plugin 'neoclide/coc.nvim', {'branch': 'release'}
  "Plugin 'neoclide/coc-git'
  Plugin 'mattn/emmet-vim'       " CocInstall coc-emmet'
  Plugin 'tpope/vim-haml'        " Sass
  "syntax highlighter
  Plugin 'sheerun/vim-polyglot'
  " Prettier and ESLint
  Plugin 'github/copilot.vim'
  " remote container development
  Plugin 'neoclide/jsonc.vim'
  Plugin 'jamestthompson3/nvim-remote-containers'


" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
filetype plugin on
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" General settings
filetype off                  " required
set backupdir=~/.vim/bak
set encoding=utf-8
set hidden
set updatetime=300
set ruler                     "Always show current position
set whichwrap+=<,>,h,l
set wildmenu                  "Turn on WiLd menu
set noerrorbells              " no sound on error
set visualbell                " for wls win linux subsystem
set ls=2                      " allways show status line
set smartcase          " -------search--------
set hlsearch                  "Highlight search things
set ignorecase                "Ignore case when searching
set incsearch
set nolazyredraw              "Don't redraw while executing macros
set magic           "Set magic on, for regular expressions
set showmatch "Show matching bracets when text indicator is over them
set tabstop=2       " The width of a TAB is set to 2.
set shiftwidth=2    " Indents will have a width of 2
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set lbr
" set tw=500
set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
let g:html_indent_inctags = "html,body,head,tbody,table,tr,td,div,ul,li"

" vimdiff ignore white space
if &diff
  " diff mode
  set diffopt+=iwhite
endif

"" set ',' as leader
let mapleader=","

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" large buffer
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Theme
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
set background=dark
colorscheme PaperColor

let g:used_javascript_libs = 'underscore,jquery,react,d3' " othree/javascript-libraries-syntax.vim

" autocomplete
set shortmess+=c        " Don't pass messages to |ins-completion-menu|
set omnifunc=syntaxcomplete#Complete

" coc
let g:coc_global_extensions = [
  "\ 'coc-git',
  \]
  "\ 'coc-tsserver',

" " ALE
" let g:ale_sign_error = '>'
" let g:ale_sign_warning = '-'
" let g:ale_sign_info = '*'
" let g:ale_sign_style_error = '$'
" let g:ale_sign_style_warning = 's'
" let g:ale_linters = {
"   \  'cs'        : ['OmniSharp'],
"   \  'python'    : ['flake8', 'pylint'],
"   \  'javascript': ['eslint'],
"   \  'vue'       : ['eslint']
"   \}
" let g:ale_fixers = {
"   \  'javascript': ['prettier', 'eslint'],
"   \  'typescript': ['prettier', 'tslint'],
"   \  'vue'       : ['eslint','stylelint'],
"   \  'scss'      : ['prettier'],
"   \  'html'      : ['prettier'],
"   \}
" let g:ale_linters_explicit = 1
" let g:ale_fix_on_save = 1
" let g:airline#extensions#ale#enabled = 1      " airline integration
" let g:ale_completion_enabled = 1

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" open terminal
nnoremap <silent> <Leader>t :terminal<CR>
" to start scroll <c-N>, i / a to resume editing

" key mapping
" note: for <cword> use  <c-r><c-w>
" FZF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>w :Windows<CR>
""" ctrlp to fzf
nnoremap <silent> <c-s-p> :Files<CR>
nnoremap <silent> <Leader>// :Rg<CR>
"nnoremap           <Leader>// :tabe <bar> :read !rg -i <c-r><c-w>
nnoremap <silent> <Leader><C-_> :Rg <c-r><c-w><CR>
"nnoremap           <Leader><C-_> :tabe <bar> :read !rg -i <c-r><c-w><CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>
"> NERDTree
nnoremap           <Leader>f :NERDTreeFind<CR>
" FuGITive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
nnoremap <silent> <Leader>gc :Commits<CR>
nnoremap <silent> <Leader>gb :BCommits<CR>
nnoremap <silent> <Leader>gv :Gvdiffsplit<CR>
nnoremap <silent> <Leader>gV :Gvdiffsplit <c-r>"<CR>
nnoremap <silent> <Leader>gg :GV --all --author-date-order<CR>
nnoremap <silent> <Leader>GG :GV --author-date-order<CR>
" --graph -> :GV  / :GV --all  / :GV!  :GV?
"         -> CTRL-N / CTRL-P
"         -> q  / gq
" CoC
" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
"nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
"nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" github copilot
nnoremap <leader>ps :call coc#float#show('github', 'p')<CR>

" Cycle through GitHub Copilot suggestions
inoremap <leader>gn <C-n>
inoremap <leader>gp <C-p>


" - Most commands support CTRL-T / CTRL-X / CTRL-V key bindings to open in a new
"   tab, a new split, or in a new vertical split
"> save and copy
"nnoremap <silent> <Leader>u  :w <bar> :silent exec("!docker cp % <c-r>u:/opt/app-root/src/%")<CR>
"nnoremap <silent> <Leader>p  :w <bar> :silent exec("!docker cp % <c-r>p:/opt/app-root/src/%")<CR>
nnoremap <silent> <Leader>u  :w <bar> :!docker cp % <c-r>u:/home/node/app/%<CR>
nnoremap <silent> <Leader>p  :w <bar> :!docker cp % <c-r>p:/opt/app-root/src/%<CR>
set re=0
