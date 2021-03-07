""""" USAGE """"
" After adding a new plug, close/reopen nvim and run :PlugInstall
""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree' " File tree
"Plug 'tpope/vim-sensible' " A bunch of pragmatic defaults
Plug 'flazz/vim-colorschemes' " Enable Color Schemes
"
"" Elixir support
Plug 'elixir-editors/vim-elixir'
"Plug 'slashmili/alchemist.vim'
"Plug 'gasparch/vim-elixir-fold'
"
"" Clojure support
"""""" Getting to evaluation
Plug 'tpope/vim-dispatch' " Needed for async dispatch
Plug 'radenling/vim-dispatch-neovim'
Plug 'clojure-vim/vim-jack-in'
Plug 'Olical/conjure', { 'tag': 'v4.13.0' }
""""""

"Plug 'gberenfield/cljfold.vim'
"Plug 'Vigemus/impromptu.nvim'
"Plug 'clojure-vim/jazz.nvim'
"
"Plug 'guns/vim-clojure-static'
"
"" Searching
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

"Plug 'liuchengxu/vim-which-key' " Vim keybinding hints
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Interactive Searching
Plug 'junegunn/fzf.vim'



call plug#end()
