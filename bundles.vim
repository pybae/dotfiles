"Setup Bundle {{{
    filetype off 
    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()
"}}}


"Bundles {{{
    "Dependencies {{{
        Bundle 'gmarik/vundle'
        Bundle 'MarcWeber/vim-addon-mw-utils'
        Bundle 'tomtom/tlib_vim'
        Bundle 'tpope/vim-dispatch'
        Bundle 'kana/vim-textobj-user'
    "}}}

    "Core {{{
        if executable('ack-grep')
            let g:ackprg="ack-grep -H --nocolor --nogroup --column"
            Bundle 'mileszs/ack.vim'
        elseif executable('ack')
            Bundle 'mileszs/ack.vim'
        elseif executable('ag')
            Bundle 'mileszs/ack.vim'
            let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
        endif

        Bundle 'tpope/vim-unimpaired'
        Bundle 'tpope/vim-surround'
        Bundle 'tpope/vim-repeat'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'Raimondi/delimitMate'
        Bundle 'godlygeek/tabular'
        Bundle 'kien/ctrlp.vim'
        Bundle 'honza/vim-snippets'
        Bundle 'ervandew/supertab'
        Bundle 'terryma/vim-multiple-cursors' 
    "}}}

    "Eyecandy{{{
        Bundle 'sjl/badwolf'
        Bundle 'croaky/vim-colors-github'
        Bundle 'bling/vim-airline'
        Bundle 'jnurmine/Zenburn'
        Bundle 'nanotech/jellybeans.vim'
        Bundle 'chriskempson/vim-tomorrow-theme'
    "}}}
    
    "Git{{{
        Bundle 'airblade/vim-gitgutter'
        Bundle 'tpope/vim-fugitive'
    "}}}
    
    "Web{{{
        Bundle 'mattn/emmet-vim'
    "}}}

    "Ruby & Rails{{{
        Bundle 'nelstrom/vim-textobj-rubyblock'
        Bundle 'tpope/vim-rails'
        Bundle 'thoughtbot/vim-rspec'
    "}}}

    "Go{{{
        Bundle 'fatih/vim-go'
    "}}}
    
    "Rust{{{
        Bundle 'rust-lang/rust.vim'
    "}}}
"}}}
