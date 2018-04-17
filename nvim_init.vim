" ============================================================================
"                                                  o8o
"                                                  `"'
"     ooo. .oo.    .ooooo.   .ooooo.  oooo    ooo oooo  ooo. .oo.  .oo.
"     `888P"Y88b  d88' `88b d88' `88b  `88.  .8'  `888  `888P"Y88bP"Y88b
"      888   888  888ooo888 888   888   `88..8'    888   888   888   888
"      888   888  888    .o 888   888    `888'     888   888   888   888
"     o888o o888o `Y8bod8P' `Y8bod8P'     `8'     o888o o888o o888o o888o
"     ===================================================================
"
" ============================================================================
"      Author: Stephan Engelmann
"        File: ~/.config/nvim/init.vim
" Description: - a productive environment for programming
"              - supports a lot of different languages with auto completion
"       Setup: - create directories and setup plug-in manager
"              - Install Plug-ins e.g. :PlugInstall
"
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" ============================================================================


" ==================== PLUG-INS ==============================================
call plug#begin()

" auto complete plug-ins
Plug 'roxma/nvim-completion-manager'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'SirVer/ultisnips'
Plug 'calebeby/ncm-css'
"Plug 'davidhalter/jedi' # python linter jedi is installed via package manager
Plug 'fgrsnau/ncm-otherbuf'
Plug 'godoctor/godoctor.vim'
Plug 'honza/vim-snippets'
Plug 'jodosha/vim-godebug'
Plug 'othree/csscomplete.vim'
Plug 'roxma/ncm-clang'
Plug 'roxma/ncm-flow'
Plug 'roxma/ncm-github'
Plug 'roxma/nvim-cm-tern'
Plug 'sassanh/nvim-cm-eclim'
Plug 'zchee/deoplete-go'

" other plug-ins
Plug 'Raimondi/delimitMate'
Plug 'Shougo/denite.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'brooth/far.vim'
Plug 'chrisbra/Colorizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/vim-emoji'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ==================== Settings ==============================================

filetype plugin indent on
syntax enable
let mapleader = ","

" automatically reload neovim config after save
autocmd! bufwritepost nvim_init.vim source %
" remove trailing whitespace at save
autocmd BufWritePre * :%s/\s\+$//e

set autoindent
set autoread                         " reload files onto change
set backspace=eol,start,indent
set clipboard+=unnamedplus
set cursorline
set colorcolumn=80
set copyindent
set expandtab
set foldlevel=99
set foldmethod=indent
set hid                             " Hide Buffer if abandoned
set hidden                          " hide closed buffers rather than deleting
set history=1000
set hlsearch
set ignorecase                      " ignore case when searching
set incsearch
set laststatus=2
set noerrorbells
set noswapfile
set scrolloff=3
set shiftround
set shiftwidth=2
set showmatch
set smarttab
set softtabstop=2
set spelllang=en,de
set tabstop=2
set title
set tw=79
set virtualedit=all
set whichwrap+=<,>,h,l
set wrap

" Tab completion for filenames
set wildmenu
set wildignore=*.o,*~,*.pac,*.javac,*.swp,*.bak,*.pyc,*.class

" relative line numbering
set number relativenumber
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber

" ==================== Key mappings ==========================================

" Move between split windows using <Ctrl> + neovim standard movement keys
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" spell checking
map <leader>s? z=
map <leader>sa zg
map <leader>sn ]s
map <leader>sp [s
map <leader>ss :setlocal spell!<cr>

" Move code blocks without loosing selection
vnoremap < <gv
vnoremap > >gv

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" en/disable highlighting
map <leader><space> :noh<CR>

" Sort selected lines alphabetically
vnoremap <leader>s :sort<CR>

" Easy paragraph formatting
vmap Q gp
nmap Q gqap

" move between multiple errors
map ]q :cprevious<cr>
map [q :cnext<cr>

" ============================================================================
" Plug-in Configuration
" ============================================================================

" neovim-completion-manager
" =========================
let g:UltiSnipsExpandTrigger="<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:cm_completeopt = 'menu,menuone,noinsert,noselect,preview'
imap <expr> <cr>  (pumvisible() ?  "\<C-y>\<Plug>(expand_or_nl)" : "\<cr>")
imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-u>":"\<cr>")
inoremap <silent> <C-u> <C-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Close the prevew window automatically on InsertLeave
augroup ncm_preview
  autocmd! InsertLeave <buffer> if pumvisible() == 0|pclose|endif
augroup END

" Auto complete brackets 'Raimondi/delimitMate'
let delimitMate_balance_matchpairs = 1
"let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

" Emoji support 'junegunn/vim-emoji'
"set omnifunc=emoji#complete

" Hint column on left side for git changes 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle_down')
let g:gitgutter_sign_modified_removed = emoji#for('collision')

" File Tree 'scrooloose/nerdtree'
nmap <leader>f :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" A Powerline Alternative 'vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_symbols_crypt = ''

" Tagbar settings
nmap <leader>t :TagbarToggle<CR>

" ==================== LATEX =================================================
let g:tex_flavor = "latex"
let g:vimtex_enabled = 1
let g:vimtex_syntax_minted = [{
      \   'lang' : 'cpp',
      \   'environments' : ['cppcode', 'cppcode*', 'cppcode_something'],
      \ }]
let g:vimtex_latexmk_build_dir = 'build'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
" for autocomplete
augroup my_cm_setup
  autocmd!
  autocmd User CmSetup call cm#register_source({
    \ 'name': 'vimtex',
    \ 'priority': 8,
    \ 'scoping': 1,
    \ 'scopes': ['tex'],
    \ 'abbreviation': 'tex',
    \ 'cm_refresh_patterns': g:vimtex#re#ncm,
    \ 'cm_refresh': {'omnifunc': 'vimtex#complete#omnifunc'},
    \ })
augroup END

" ==================== COLORSCHEME ===========================================
" The "solarized" colorscheme is available in dark and light and can be
" switched by pressing <F12>.
" ============================================================================
set background=dark
colorscheme solarized
call togglebg#map("<F12>")
