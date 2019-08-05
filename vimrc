" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set ttyfast
set lazyredraw

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

set shortmess=atI " 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=Ot "Fix: Press Enter or type command to continue

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

set synmaxcol=300               " 语法高亮渲染最大列数
set nocursorline                " 指示当前行，具体样式就主题有所不同 set [no]cusorline/[no]cul, default
set nocursorcolumn              " 指示当前列，具体样式就主题有所不同 set [no]cusorcolumn/[no]cuc, default

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" =============== Vim-Plug Initialization ===============
if filereadable(expand("~/.vim/plug.vim"))
  source ~/.vim/plug.vim
endif
au BufNewFile,BufRead *.vim set filetype=vim

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
" if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

vnoremap <leader>p "0p
vnoremap <leader>P "0P

scriptencoding utf-8
set encoding=utf-8
" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

"set nowrap       "Don't wrap lines
set wrap       "Default wrap
let &colorcolumn=join(range(121,999),",")

set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.pyc,.git,build/*,*.beam,ebin/*,*.class,*.lo,*.log,*coverage*,*/tmp/*,*.so,*.swp,*.zip

" ================ Scrolling ========================

set scrolloff=3         "Start scrolling when we're 3 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Custom Settings ========================
so ~/.yadr/vim/settings.vim

autocmd BufWritePre * :%s/\s\+$//e

" 把当前行作为 shell 命令异步执行
nnoremap <Leader>ec :call RunCurrentLine()<CR>
func! RunCurrentLine()
  let lines = getline('.')
  exec "AsyncRun ".lines
endfunc
