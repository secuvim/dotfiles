" # vim:ts=2:sw=2:ai:foldmethod=marker:foldlevel=0:

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
"      Author: Stephan Engelmann (secuvim)
"        File: ~/.config/nvim/init.vim
" Description: - a productive environment for programming
"              - supports a lot of different languages with auto completion
"       Setup: - create directories and setup plug-in manager:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"              - Install Plug-ins e.g. :PlugInstall
" ============================================================================

" ==================== Installed PLUG-INS ======================== {{{1
call plug#begin()
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
Plug 'Shougo/echodoc'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'SirVer/ultisnips'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'brooth/far.vim'
Plug 'carlitux/deoplete-ternjs'
Plug 'chrisbra/Colorizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'davidhalter/jedi-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'fisadev/vim-isort'
Plug 'fszymanski/deoplete-emoji'
Plug 'godoctor/godoctor.vim'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'icymind/NeoSolarized'
Plug 'jlanzarotta/bufexplorer'
Plug 'jodosha/vim-godebug'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'nvie/vim-flake8'
Plug 'othree/csscomplete.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'valloric/MatchTagAlways'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/tmux-complete.vim'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-go'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-zsh'
call plug#end()

" ==================== Settings ================================== {{{1
filetype plugin indent on
syntax enable
let mapleader = ","
let maplocalleader = ";"
" automatically reload neovim config after save
"autocmd! bufwritepost nvim_init.vim source %
" remove trailing whitespace at save
autocmd BufWritePre * :%s/\s\+$//e
set autoindent
set autoread                         " reload files onto change
set backspace=eol,start,indent
set clipboard=unnamedplus
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
set termguicolors
set title
set tw=78
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

" ==================== Key mappings ============================== {{{1
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

" deoplete specific mappings
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <C-k> i_<Plug>(neosnippet_expand_or_jump)
smap <C-k> s_<Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" ==================== Plugins =================================== {{{1
" ==================== deoplete ================================== {{{2
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:UltiSnipsExpandTrigger="<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" auto-close preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" ==================== jedi-vim ================================== {{{2
" All these mappings work only for python code:
" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0
" Go to definition
let g:jedi#goto_command = '<leader>d'
" Find ocurrences
let g:jedi#usages_command = '<leader>o'
" Find assignments
let g:jedi#goto_assignments_command = '<leader>a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" ==================== vim-gitgutter ============================= {{{2
" Hint column on left side for git changes 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed_first_line = emoji#for('small_red_triangle_down')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('fire')

" ==================== NERDTree ================================== {{{2
nmap <leader>f :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 40

" ==================== vim-airline =============================== {{{2
let g:airline_powerline_fonts = 1
let g:airline_symbols_crypt = ''

" ==================== tmuxline ================================== {{{2
" config can be exported and loaded in ~/.tmux.conf
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    : '#(~/.sbin/battery)',
      \'y'    : ['%Y-%m-%d', '%H:%M'],
      \'z'    : '#H'}

" ==================== tagbar ==================================== {{{2
nmap <leader>t :TagbarToggle<CR>

" ==================== numirias/semshi =========================== {{{2
let g:semshi#simplify_markup = v:false
function MyCustomSemshiHighlights()
  hi semshiSelected ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#606060
  hi semshiImported ctermfg=214 guifg=#ffaf00 cterm=italic gui=italic
endfunction
autocmd FileType python call MyCustomSemshiHighlights()

" ==================== flake8 ==================================== {{{2
" Execute python style check flake8 (extended pep8 version) as save action
autocmd BufWritePost *.py call Flake8()

" ==================== LATEX ===================================== {{{2
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

" ==================== Markdown-Preview ========================== {{{2
let g:mkdp_markdown_css = '/home/stephan/.config/nvim/markdown_preview_styles/markdown.css'
" ==================== COLORSCHEME =============================== {{{1
" The "solarized" colorscheme is available in dark and light and can be
" switched by pressing <F12>.
set background=dark
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
colorscheme NeoSolarized

" <F12> background toggle dark/light theme
function ToggleBackground()
  let &background = ( &background == "dark"? "light" : "dark" )
endfunction
noremap <F12> :call ToggleBackground()<CR>
