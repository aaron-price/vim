""""" USAGE """"
" After adding a new plug, close/reopen nvim and run :PlugInstall
""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree' " File tree
"Plug 'ryanoasis/vim-devicons' " filetype icons
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " filetype color

Plug 'tpope/vim-sensible' " A bunch of pragmatic defaults
Plug 'flazz/vim-colorschemes' " Enable Color Schemes

" Elixir support
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'gasparch/vim-elixir-fold'

" Clojure support
Plug 'gberenfield/cljfold.vim'
" run 'pip3 install --user pynvim' first
Plug 'clojure-vim/acid.nvim', { 'do': 'UpdateRemotePlugins'} 
Plug 'Vigemus/impromptu.nvim'
Plug 'clojure-vim/jazz.nvim'

Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'

" Searching
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion
Plug 'liuchengxu/vim-which-key' " Vim keybinding hints
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Interactive Searching
Plug 'junegunn/fzf.vim'



call plug#end()
