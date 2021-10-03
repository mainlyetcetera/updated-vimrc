" start to my sets
set shiftwidth=2
set relativenumber
set numberwidth=5
set tabstop=1 softtabstop=2
set expandtab
set smartindent
set nu
set noswapfile
set incsearch
set scrolloff=6
set completeopt=menuone,preview,noinsert,noselect
set signcolumn=yes
set colorcolumn=80
set signcolumn=yes
set guifont=Monaco:h10
set nowrap

" sets not using right now
"
" coloring for parens and 80-mark line
hi ColorColumn ctermbg=lightgrey guibg=lightgrey
hi MatchParen cterm=bold ctermbg=none ctermfg=green

" lets
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25 

" general setup 
if executable('rg')
  let g:rg_derive_root='true'
endif

" insert-mode remaps
inoremap <backspace> <nop>
inoremap <leader>kj <Esc>

" normal-mode remaps
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :wincmd u<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>+ :vertical resize +5<CR> 
nnoremap <Leader>- :vertical resize -5<CR> 
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>am :term<CR>
" I want to use the same keybinding to close the terminal, need fn for that?
nnoremap <leader>kj <Esc><CR>
nnoremap <leader>7 <C-^><CR>
nnoremap <Space> <nop>
nnoremap <leader><ENTER> i <Esc>r<ENTER>k<CR>

" Fugitive
" merge-conflict remaps
" go into merge-conflict window with dv
nnoremap <leader>tl :diffget //3<CR>
nnoremap <leader>th :diffget //2<CR>
nnoremap <leader>ts :G<CR>
nnoremap <leader>tc :Git commit<CR>
nnoremap <leader>tk :Git checkout<CR>

" command-mode remaps
cnoremap <leader>kj <Esc><CR>

" visual-mode remaps
vnoremap <leader>kj <Esc><CR>

" terminal-mode remaps, local is <C-W>N or <C-\><C-n>, using first here
" just puts you into mode where vim commands recognized, still need :q!
tnoremap <leader>kj <C-W>N
tnoremap <leader>am <C-W>N:q!<Enter>

" for YCM Completer
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <silent> <Leader>g= :YcmCompleter Format<CR>

" maps I don't know what they do yet
" inoremap <C-f> <Esc><Esc>:BLines!<CR>
" map <C-g> <Esc><Esc>:BCommits!<CR>

" FZF remaps
" needed to change this to o, 
" other maps were expecting p,
" leading to delay
map <leader>o <Esc><Esc>:Files!<CR>

" primagen remaps
" nnoremap <leader>gc :GCheckout<CR>
" are we switching to this:

" plugin setup
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugin section for now
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'morhetz/gruvbox'
Plug 'git@github.com:ycm-core/YouCompleteMe.git'
Plug 'mbbill/undotree'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
call plug#end()

" fzf settings still understanding
" let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } } let $FZF)DEFAULT_OPTS
" let $FZF_DEFAULT_OPTS='--reverse'

" gruvbox settings
colorscheme gruvbox
set background=dark

" transparent background
hi! Normal guibg=NONE ctermbg=NONE
" hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" remaps for toggling qf list
nnoremap <C-k> :cnext<CR>
nnoremap <C-j> :cprev<CR>
