""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" github.com/pybae/dotfiles
" this config tends to rely heavily on plugins, and manages those by Vundle.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Environment Setup {{{
set nocompatible "must be the first line
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
set shell=/bin/bash

" For custom-textobj
runtime macros/matchit.vim
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

if version < 703
    echom "svim has been tested on vim 7.3 and above, older versions of vim may not be fully supported. PROCEED WITH CAUTION"
endif

if filereadable(expand ("~/.bundles.vim")) "initialize the bundles
    source ~/.bundles.vim
endif
" }}}

" Core Settings {{{
syntax enable "enable syntax for files
filetype plugin on
filetype indent on
filetype plugin indent on

set nobackup                        "no backups, and no files dangling everywhere
set noswapfile                      "same intent as the above
set nowritebackup                   "backups aren't written

set autochdir                       "working directory is the same as the current file
" set cursorline                      "current line cursor is on, is highlighted
set scrolloff=5                     "so, and setting where the line should start, greater than 5 is more to the middle
set relativenumber                  "relative numbers for fast jumping
set number                          "show current line number

set ignorecase                      "ignores case while searching
set smartcase                       "Based on a heuristic whether to ignore cases or not
set incsearch                       "goes to the next search word as we type

set mouse=a                         "mouse set to all on every mode
set showmatch                       "shows brackets around in matching ones
set hlsearch                        "highlights search objects in search
set wildmenu                        "in command line hit <TAB> to show likely completions
set showcmd                         "in bottom right corner, displays typed words
set copyindent                      "when pasting, copies indentation
set backspace=indent,eol,start      "backspace, goes through newlines, and start of file
set splitbelow                      "opens splits below
set splitright                      "opens splits to the right by default
set pastetoggle=<F2>                "retains proper indentation when posting from the OS's clipboard
set hidden                          "buffers never disappear, but rather stay hidden
"}}}

"Filetype Specific Settings {{{
"Indentation
" Tabs are 2 by default, and depending on the file type more
set shiftwidth=2                    "shift width for tabbing is set at 2 now
set tabstop=2                       "soft tab spot is set at 2 now
set expandtab                       "tabs are now spaces
set autoindent                      "based on previous indentation, indents properly
set smartindent                     "indentation is 'smart' according to file type and plugins

augroup four_spaces
    autocmd!
    autocmd FileType c    setlocal shiftwidth=4 tabstop=4
    autocmd FileType cpp  setlocal shiftwidth=4 tabstop=4
    autocmd FileType java setlocal shiftwidth=4 tabstop=4
    autocmd FileType zsh  setlocal shiftwidth=4 tabstop=4
    autocmd FileType vim  setlocal shiftwidth=4 tabstop=4
augroup END

"}}}

" Eyecandy {{{
set t_Co=256                        "enables 256 color support
if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove tool bar
    set guioptions-=r  "remove right-hand scroll bar
endif

set noerrorbells "disables sounds
set visualbell "enables visual bell
"sets visual bell to nothing
set t_vb=

let g:current_color_scheme=1
colorscheme jellybeans

function! SwitchColors()
  if g:current_color_scheme
      colorscheme Tomorrow
      let g:current_color_scheme=0
  else
      colorscheme jellybeans
      let g:current_color_scheme=1
  endif
endfunction

nnoremap <silent> <F12> :call SwitchColors()<CR>

"Statusline
set laststatus=2
"let g:airline_left_sep=''
"let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

" Gitgutter
highlight clear SignColumn
"}}}

" General Mappings {{{
noremap : ;
noremap ; :

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

inoremap <C-n> <Down>
inoremap <C-p> <Up>

set pastetoggle=<F9>

"CtrlP
let g:ctrlp_map = '<space>f'

"Tabs
"Use gt for next tab and gT for previous tab
"{i}gt to jump to ith tab
nnoremap <silent> <space>tn :tabnew<CR>
nnoremap <silent> <space>ts :tabs<CR>
nnoremap <silent> <space>tq :tabclose<CR>
" }}}

" Mappings {{{
let mapleader = ","
"faster editing for vim rc files
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>bv :vsplit ~/.bundles.vim<CR>

nnoremap <silent> <leader>o :!open .<CR>

"leader slash to clear highlights
nnoremap <silent> <leader>/ :nohlsearch<CR>

"ctags for the current directory
nnoremap <leader>ct :!ctags -R .<CR>

"Rspec!
if filereadable("bin/rspec")
  let g:rspec_command = '!rspec {spec}'
endif

nnoremap <leader>f :call RunCurrentSpecFile()<CR>
nnoremap <leader>s :call RunLastSpec()<CR>
nnoremap <leader>a :call RunAllSpecs()<CR>
"}}}

"Autocompletion{{{
set completeopt=menuone
set pumheight=7
"}}}

"CtrlP{{{
"Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_use_caching = 0
endif
"}}}

"Multiple Cursors{{{
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"}}}

"Fugitive{{{
nnoremap <silent> <leader>gs :<C-u>Gstatus<CR>
nnoremap <silent> <leader>gd :<C-u>Gdiff<CR>
nnoremap <silent> <leader>gl :<C-u>Glog<CR>
nnoremap <silent> <leader>gb :<C-u>Gblame<CR>
"}}}

"Easymotion{{{
let g:EasyMotion_smartcase = 1
let g:EasyMotion_enter_jump_first = 1
"}}}
