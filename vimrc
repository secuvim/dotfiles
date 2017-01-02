" ============================================================================
"
"                          o8o
"                          `"'
"             oooo    ooo oooo  ooo .oo.  .oo.   oooo d8b  .ooooo.
"              `88.  .8'  `888  `888P"Y88bP"Y88b  `888""8P d88' `"Y8
"               `88..8'    888   888   888   888   888     888
"         .o.    `888'     888   888   888   888   888     888   .o8
"         Y8P     `8'     o888o o888o o888o o888o d888b    `Y8bod8P'
"         ==========================================================
"
"      Author: Stephan Engelmann
"        File: ~/.vimrc
" Description: - a vimrc with Vundle to handle plug-ins
"              - should provide an IDE like experience for a range of
"                languages
"              - support for git, doxygen, latex
" ============================================================================

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ============================================================================
" vundle - vim plug-in manager
" ============================================================================

" for first time setup use:
" # mkdir -p ~/.vim/bundle
" # git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
Plugin 'gmarik/vundle'

" cmake - in editor support of CMake
Plugin 'vhdirk/vim-cmake'

" fugitive - git interface
Plugin 'tpope/vim-fugitive'

" molokai - currently used color theme
Plugin 'tomasr/molokai'

" nerdcommenter - fast and easy un/commenting
Plugin 'scrooloose/nerdcommenter'

" nerdtree - file browser
Plugin 'scrooloose/nerdtree'

" powerline - a better notification line
" fonts have to be installed manually
" # mkdir ~/.fonts
" # cd ~/.fonts
" # git clone git://github.com/Lokaltog/powerline-fonts.git
" # fc-cache -vf
" additional configuration file can be made by copying and modifying
"   <plugin>/powerline/powerline/config_files/themes/vim/default.json
" to
"   <home>/.config/powerline/themes/vim/default.json
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" tagbar - display class and fuction tags
Plugin 'majutsushi/tagbar'

" ultisnips - a snipped engine
Plugin 'SirVer/ultisnips'

" vim latex suite - a latex editing environment
Plugin 'lervag/vimtex'

" you complete me - auto complete everything !!! YOU WILL NEVER GO BACK !!!
Plugin 'valloric/youcompleteme'

" a more advanced way to manage buffers
Plugin 'jlanzarotta/bufexplorer'

" auto complete counterparts like brackets
Plugin 'Raimondi/delimitMate'

" Syntax checking - Syntastic
"Plugin 'scrooloose/syntastic'

" JavaScript - better syntax highlighting
Plugin 'jelera/vim-javascript-syntax'

" JavaScript - adding more highlighting, fixing indentions
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'

" JavaScript - adding Tern based completions
Plugin 'ternjs/tern_for_vim'

" JavaScript auto formatter
Plugin 'maksimr/vim-jsbeautify'

" ============================================================================
" Settings
" ============================================================================

filetype plugin indent on
syntax on
let mapleader = ","
let maplocalleader = "ä"

let g:load_doxygen_syntax=1

autocmd! bufwritepost .vimrc source % " automatically reload .vimrc after save
autocmd BufWritePre * :%s/\s\+$//e    " remove trailing whitespaces at save

set autoindent
set autoread
set backspace=eol,start,indent
set cmdheight=2
set colorcolumn=80
set copyindent
set encoding=utf8
set expandtab
set exrc                            " force loading of project specific .vimrc
set ffs=unix,dos,mac
set fo-=t
set foldlevel=99
set foldmethod=syntax
set guifont=Liberation\ Mono\ for\ Powerline\ 9
set guioptions-=L
set guioptions-=T
set guioptions-=m
set guioptions-=r
set hid                             " Hide Buffer if abandoned
set hidden                          " hide closed buffers rather than deleting
set history=1000
set hlsearch
set ignorecase                      " ignore case when searching
set incsearch
set lazyredraw
set lbr
set magic
set mat=2
set nobackup
set noerrorbells
set noswapfile
set novisualbell
set nowb
set nowrap
set nowritebackup
set number                          " show line numbers
set ruler
set scrolloff=3
set secure                          " restrict command usage in other .vimrc
set shiftround
set shiftwidth=2
set showmatch
set si
set smartcase
set smarttab
set softtabstop=2
set spellfile=/home/stephan/.vim/spellfile..add
set spelllang=en,de
set t_Co=256
set t_vb=
set tabstop=2
set title
set tm=500
set tw=79
set undolevels=1000
set virtualedit=all
set visualbell
set whichwrap+=<,>,h,l
set wildignore=*.o,*~,*.pac,*.javac,*.swp,*.bak,*.pyc,*.class
set wildmenu
set wrap

" ============================================================================
" Key mappings
" ============================================================================

" Move between split windows using <Ctrl> + vim standard movement keys
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" Move code blocks without loosing selection
vnoremap < <gv
vnoremap > >gv

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" spell check bindings
map <leader>s? z=
map <leader>sa zg
map <leader>sn ]s
map <leader>sp [s
map <leader>ss :setlocal spell!<cr>

" en/disable highlighting
map <leader><space> :noh<CR>

" Sort selected lines alphabetically
vnoremap <leader>s :sort<CR>

map +q :cprevious<cr>
map -q :cnext<cr>

" Easy paragraph formatting
vmap Q gp
nmap Q gqap

" Fullscreen toggle support
map <silent> <F11>
      \    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

" ============================================================================
" Plug-in Configuration
" ============================================================================

" NerdTree settings
nmap <leader>f :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Powerline settings
set laststatus=2
set encoding=utf8
set t_co=256
let g:Powerline_symbols = 'fancy'

" Tagbar settings
nmap <leader>t :TagbarToggle<CR>

" Ultisnips settings
let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsJumpForwardTrigger="<F2>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" vimtex settings
let g:tex_flavor = "latex"
let g:vimtex_enabled = 1
let g:vimtex_syntax_minted = [
      \ {
      \   'lang' : 'cpp',
      \   'environments' : ['cppcode', 'cppcode*', 'cppcode_something'],
      \ }
      \ ]
let g:vimtex_latexmk_build_dir = 'build'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

" enable YCM  for tex files
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
      \ ]

" You Complete Me
let g:ycm_confirm_extra_conf = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1
"let g:ycm_python_binary_path = '/usr/bin/python'
"let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_python_binary_path = 'python'
let g:ycm_server_python_interpreter = 'python'

" vim-jsbeautify on <C-f>
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Syntastic
let g:syntastic_auto_loc_list = 1
let g:syntastic_jslint_checkers = ['jslint']
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1

" ============================================================================
" Colorscheme
" ============================================================================
set background=dark
colorscheme molokai
" fixing too similar cors in vim diff mode
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
