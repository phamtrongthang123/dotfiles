
let g:python3_host_prog="/media/trongthang/Important/anaconda2/envs/work_py3/bin/python"
call plug#begin('~/.config/nvim/plugged')

    " Universal set of defaults for VIM
    Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}

    Plug 'tpope/vim-commentary'   " Comment out
    Plug 'itchyny/lightline.vim'  " Lightline
    Plug 'mbbill/undotree' " Undo panel
    Plug 'jiangmiao/auto-pairs'
    Plug 'kshenoy/vim-signature' " show markbooks

    " Tagbar
    Plug 'dangkhoasdc/tagbar'


    " Snippets
    Plug 'honza/vim-snippets'
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'

    " Linters
    Plug 'w0rp/ale'

    " Markdown
    Plug 'plasticboy/vim-markdown'

    " Autocomplete and general sources
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    "Colorscheme
    Plug 'joshdick/onedark.vim'
    Plug 'sheerun/vim-polyglot'

    "Check grammar
    Plug 'rhysd/vim-grammarous'
call plug#end()

" Basic Setup {{{
"
    " Always show statusline
    set laststatus=2
    "" Use 256 colours (Use this setting only if your terminal supports 256 colours) 
    set t_Co=256
    " automatically load the buffer if an external program edited
    set autoread
    set exrc
    filetype on
    filetype plugin indent on
    set conceallevel=0
    set history=1000 " Store much more histories
                     " Indentation
    set tabstop=4
    set softtabstop=0
    set shiftwidth=4
    set expandtab

    set hidden
    set clipboard+=unnamedplus

    " user interface
    set mouse=       " Enable mouse usage
    set mousehide    " Hide the mouse cursor while typing
    set number
    set relativenumber
    set showcmd
    set cursorline
    set wildmenu
    set lazyredraw
    set noruler
    set colorcolumn=80

    " searching
    set incsearch
    set hlsearch
    set ignorecase
    set smartcase
    set inccommand=split

    "folding
    set foldenable
    set foldlevelstart=2
    set foldnestmax=10
    set foldmethod=indent

    " hotkeys binding {{{
        nnoremap <space> <nop>
        let mapleader = "\<space>"
        let maplocalleader = "\\"
        nnoremap <bs> <c-^>
        nnoremap j gj
        nnoremap k gk
        nnoremap B ^
        nnoremap E $
        nnoremap <C-p> :FZF<CR>
        " convert : -> ;. the whole life begins
        inoremap jk <esc>

        vnoremap < <gv
        vnoremap > >gv
        " Window Navigation
        map <C-k> <C-W>k
        map <C-i> <C-W>i
        map <C-j> <C-W>j
        map <C-l> <C-W>l
        map <C-h> <C-W>h

        

    syntax enable
    set background=dark
    colorscheme onedark
    set termguicolors
    set tabpagemax=15           " Only show 15 tabs
    set showmode                " Display the current mode
    set cursorline              " Highlight current line
    highlight clear SignColumn  " SignColumn should match background
    " Current line number row will have same background color in relative mode
    highlight clear LineNr


" NeoSnippet Configurations {{{
    let g:neosnippet#disable_select_mode_mappings=0
    let g:neosnippet#enable_snipmate_compatibility = 1
    " Tell NeoSnippet about the other snippets
    let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/snippets/'

    " Use <C-k> to expand a snippet
        imap <C-k>     <Plug>(neosnippet_expand_or_jump)
        smap <C-k>     <Plug>(neosnippet_expand_or_jump)
        xmap <C-k>     <Plug>(neosnippet_expand_target)

" Markdown setting
" Disable super annoying syntax concealling of Markdown
let g:vim_markdown_conceal=0
let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
            \ ]
        \ }
" deoplete {{{
    let g:deoplete#enable_at_startup = 1

    " let g:deoplete#disable_auto_complete = 1
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
    " language configuration
    "
    let g:deoplete#min_pattern_length = 4


" Lightline
    let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }


" Only check grammar in Comment at source code, except markdown and help file
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0,
            \ }
