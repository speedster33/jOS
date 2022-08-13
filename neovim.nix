{ config, pkgs, lib, ... }:

{
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      withNodeJs = true;
      viAlias = true;
      vimAlias = true;

      configure.customRC = ''

        let mapleader = ","

        nnoremap Y y$

        " color scheme
        colorscheme orbital "pablo
        let g:AirlineTheme='orbital'

        " features
        filetype plugin indent on
        syntax enable

        " tabbing
        set autoindent
        set expandtab
        set shiftwidth=4
        set smarttab
        set softtabstop=4
        set tabstop=4

        " settings
        set autoread
        set autowrite
        set clipboard=unnamedplus
        set complete+=kspell " :set spell to activate dictonary spelling
        set cursorcolumn
        set cursorline
        set encoding=utf-8
        set history=50
        set ignorecase
        set incsearch
        set mouse=a
        set noruler
        set noshowmode
        set nowrap
        set number
        set path+=** "search for subfolders with :find
        set relativenumber
        set scrolloff=2
        set showmatch
        set smartcase
        set undofile
        set wildmenu "menu for ^^ && other things

        " coc requirements
        set cmdheight=2
        set hidden
        set nobackup
        set nowritebackup
        set shortmess+=c
        set updatetime=100

        " Always show the signcolumn, otherwise it would shift the text each time
        " diagnostics appear/become resolved.
        set signcolumn=number

        nmap <leader>F gg=G<C-o>
        nmap <leader>w <C-w><C-w>

        "NerdTree
        nnoremap <leader>n :NERDTreeFocus<CR>
        "Tab
        nnoremap <C-f> :NERDTree<CR>
        nnoremap <C-t> :NERDTreeToggle<CR>
        nnoremap <C-F> :NERDTreeFind<CR>

        let g:NERDTreeDirArrowExpandable = '*'
        let g:NERDTreeDirArrowCollapsible = '~'

        "Better Whitespace
        let g:better_whitespace_ctermcolor='darkblue'
        let g:better_whitespace_enabled=1
        let g:strip_whitespace_on_save=1
        let g:strip_whitespace_confirm=0
        "close vim if only nerdtree
        autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

        "Ctrlp
        nnoremap <leader>p :CtrlP<CR>

        "Colorizer
        nnoremap <leader>c :ColorToggle<CR>

        "Airline
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        set guifont=Source\ Code\ Pro\ for\ Powerline:h15:cANSI
      '';

      configure.packages.joshammer = with pkgs.vimPlugins; {
        start = [
        auto-pairs
        awesome-vim-colorschemes
        colorizer
        ctrlp
        nerdtree
        nerdtree-git-plugin
        vim-airline
        vim-airline-themes
        vim-better-whitespace
        vim-commentary
        vim-devicons
        vim-fugitive
        vim-fish
        vim-nix
        vim-nerdtree-syntax-highlight
        vim-surround
        vim-visual-multi
      ];
    };
  };
}
