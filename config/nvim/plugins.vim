" List all plugins here.
"
" Configurations for plugins should be defined in plugin-config.vim
call plug#begin()

Plug 'tpope/vim-sensible'               " Some sensible settings
Plug 'tpope/vim-unimpaired'             "
Plug 'tpope/vim-repeat'                 "
Plug 'scrooloose/nerdcommenter'         " Awesome Commenting
Plug 'vim-scripts/auto-pairs-gentle'    " Add brackets automatically
Plug 'vim-scripts/autoswap.vim'         " Handle swap files intelligently
Plug 'sheerun/vim-polyglot'             " Mega language support pack
Plug 'dracula/vim'                      " Dracular color scheme
Plug 'drewtempelmeyer/palenight.vim'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'               " Git wrapper
Plug 'itchyny/lightline.vim'            " Awesome status bar
Plug 'neomake/neomake'                  " Syntax checking
Plug 'ctrlpvim/ctrlp.vim'               " ctrlp fuzzy finder
Plug 'editorconfig/editorconfig-vim'    " .editorconfig support
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Keyword completion
Plug 'tpope/vim-surround'               " Change your surroundings
Plug 'terryma/vim-multiple-cursors'     " Multiple cursors
Plug 'Yggdroot/indentLine'              " Indent guides
Plug 'easymotion/vim-easymotion'        " Navigate files with ease
Plug 'scrooloose/nerdtree'              " File tree view
Plug 'ryanoasis/vim-devicons'

Plug 'SirVer/ultisnips'                 " Snippets engine
Plug 'honza/vim-snippets'               " Snippets

Plug 'rlue/vim-fold-rspec'              " RSpec fold
Plug 'godlygeek/tabular'                " Tabularity

" May not be necessary because syntastic does a great job
" Plug 'pangloss/vim-javascript'          " JS functionality including folding
" Plug ~/dev/vim-javascript
"
Plug 'tomlion/vim-solidity'

Plug 'vim-syntastic/syntastic'
Plug 'heavenshell/vim-jsdoc'

Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'w0rp/ale'                            " Linter for prose

" UML Experimentation
" depends on brew install plantuml
Plug 'aklt/plantuml-syntax'
" Plug 'scrooloose/vim-slumlord'
"

" Code accounting hours: https://wakatime.com/vim
  Plug 'wakatime/vim-wakatime'

" Code navigation
  Plug 'majutsushi/tagbar'

  " needs npm i tern (locally)
  Plug 'ternjs/tern_for_vim'

call plug#end()
