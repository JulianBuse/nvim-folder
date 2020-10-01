
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set smartindent
set number relativenumber
set nu rnu
set wrap 
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set mouse=a
set ve+=onemore

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey 

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch' : 'release'}
" Plug 'dracula/vim', {'as': 'dracula'}
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'ap/vim-css-color'
" Plug 'alvan/vim-closetag'
Plug 'preservim/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install'}
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-python'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-latex/vim-latex'
Plug 'neoclide/coc-java'
Plug 'fannheyward/coc-texlab'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'
" Plug 'jeaye/color_coded'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'mcchrish/nnn.vim'
" Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'

call plug#end()

autocmd Filetype tex setl updatetime=1

let g:livepreview_use_biber=1
let NERDTreeShowBookmarks=1

let g:ctrlp_show_hidden=1

command Previewtex LLPStartPreview

command Cppformat %!astyle

command Term vsplit term://zsh

command Quit qa!
command Q q
command W w

if executable('rg')
    let g:rg_derive_root='true'
endif

set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
set noshowmode


let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

let g:closetag_filenames = '*.html, *.xhtml, *.phtml'
let g:closetag_xhtml_filenames = '*.xhtml, *.jsx'
let g:closetag_filetypes = 'html, xhtml, jsx'
let g:closetag_xhtml_filetypes = 'xhtml, jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
        \ 'typescript.tsx': 'jsxRegion, tsxRegion',
        \ 'javascript.jsx': 'jsxRegion, tsxRegion',
        \ }

map <C-n> :NERDTreeToggle<CR>

" autocmd vimenter * NERDTree

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

": autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" autocmd BufWinEnter * NERDTreeMirror

" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

set splitright

let NERDTreeShowHidden=1

" autocmd VimEnter * botright term ++rows=12

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']},
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \]


