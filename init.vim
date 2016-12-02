call plug#begin('~/.config/nvim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

"Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'carlitux/deoplete-ternjs'
Plug 'honza/vim-snippets'

Plug 'mhinz/vim-grepper'

" color schemes
Plug 'junegunn/seoul256.vim'
Plug 'mhartington/oceanic-next', { 'commit': 'b938fbcfdf6d66ffc9b9eb945de8b3629c634f65' }

" visual
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'

" syntax
Plug 'othree/yajs.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'neomake/neomake'

" Utilities
Plug 'scrooloose/nerdtree'
Plug 'simnalamburt/vim-mundo'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mhinz/vim-grepper'
Plug 'junegunn/fzf.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'Konfekt/FastFold'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'kshenoy/vim-signature'

call plug#end()

"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:UltiSnipsExpandTrigger='<c-j>'
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/plugged/vim-snippets/UltiSnips']

" marker signatures
let g:SignatureMarkerTextHLDynamic=1

" undo history
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif

if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif

set undodir=~/.vim/undo-dir
set undofile

" colorscheme
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
set t_Co=256
" colorscheme seoul256
colorscheme OceanicNext
set background=dark
let g:airline_theme='oceanicnext'

" syntastic
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd BufWritePost,BufEnter * Neomake


" Leader
let mapleader = " "

nmap <leader>v :vsplit<cr>

" quit
nmap <leader>q :q<cr>

" write
nmap <leader>w :w<cr>

" vertical split
nmap <leader>v :vsplit<cr>

" horizontal split
nmap <leader>s :split<cr>

" delete current buffer and keep split
nmap <leader>d :bp\|bd #<cr>

" source current file
nmap <leader>ss :so %<cr>

" show vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" search with ag
nnoremap \ :Grepper<CR>

"folding
set foldenable
set foldmethod=syntax
set foldlevelstart=4

"set tabs to 4 spaces.
set tabstop=2
set expandtab
set shiftwidth=2

" exit insert mode shortcuts
inoremap jj <ESC>
inoremap jk <ESC>

" nerdtree settings
let NERDTreeIgnore = ['\.pyc$', 'tmp', '\~$']

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" don't require W to move tabs
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

" fzf settings
nnoremap <c-p> :Buffers<cr>
nnoremap <c-t> :FZF<cr>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" deoplete settings
let g:deoplete#enable_at_startup = 1

inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"


" font
set guifont=Sauce\ Code\ Powerline:h11

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" gundo
nnoremap <C-G> :MundoToggle<CR>

"automatically indent
set smartindent
set cindent

"show line numbers on the left
set relativenumber 
set number

"case insensitive search
set ignorecase
set smartcase

" automatically reload files
set autoread

if exists("neovim_dot_app")
  call MacMenu("Window.Close Tab", "")
  map <D-w> :q <cr>
endif
