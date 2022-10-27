" ================ Vim only : start ==============
" Neovim has defaults
if !has("nvim")

  " Use Vim settings, rather then Vi settings (much better!).  " This must be first, because it changes other options as a side effect.
  set nocompatible

  set ttyfast
  set backspace=indent,eol,start  "Allow backspace in insert mode
  set history=10000               "Store lots of :cmdline history
  set autoread                    "Reload files changed outside vim
  set autoindent
  set visualbell                  "No sounds
  scriptencoding utf-8
  set encoding=utf-8
  set incsearch                   " Find the next match as we type the search
  set hlsearch                    " Highlight searches by default
  set smarttab
  set showcmd                     "Show incomplete cmds down the bottom set
  set sidescroll=1
  set tags=.tags;,tags
  set tabpagemax=50
  set listchars=tab:\>\ ,trail:-,nbsp:+ " Display tabs and trailing spaces visually
  set wildmenu                    "enable ctrl-n and ctrl-p to scroll thru matches
  set background=dark

endif
" ================ Vim only : end   ==============

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif



" make Vim 8 slow
" set lazyredraw

set smartindent

 " leave insert mode quickly
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

set shortmess=atI " 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=Ot "Fix: Press Enter or type command to continue

" ================ General Config ====================
set number                      "Line numbers are good
set gcr=a:blinkon0              "Disable cursor blink

set synmaxcol=300               " 语法高亮渲染最大列数
set nocursorline                " 指示当前行，具体样式就主题有所不同 set [no]cusorline/[no]cul, default
set nocursorcolumn              " 指示当前列，具体样式就主题有所不同 set [no]cusorcolumn/[no]cuc, default

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" =============== Vim-Plug Initialization ===============
if filereadable(expand("~/.vim/plug.vim"))
  source ~/.vim/plug.vim
endif
au BufNewFile,BufRead *.vim set filetype=vim

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Indentation ======================

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

vnoremap <leader>p "0p
vnoremap <leader>P "0P

"set nowrap       "Don't wrap lines
set wrap       "Default wrap
let &colorcolumn=join(range(151,999),",")

set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
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
set wildignore+=*/node_modules/*
" ================ Scrolling ========================

set scrolloff=3         "Start scrolling when we're 3 lines away from margins
set sidescrolloff=15

" ================ Search ===========================

set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if has("termguicolors")
    " fix bug for vim
    "set t_8f=[38;2;%lu;%lu;%lum
    "set t_8b=[48;2;%lu;%lu;%lum
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " enable true color
    set termguicolors
endif

" ================ Security ==========================
set modelines=0
set nomodeline

" ================ Custom Settings ========================
so ~/.yadr/vim/settings.vim
set clipboard=unnamedplus

autocmd BufWritePre * :%s/\s\+$//e
" tagbar 函数按出现的次序排序，默认按名称排序
let g:tagbar_sort=0
" tagbar 宽度
let g:tagbar_width=60

" 把当前行作为 shell 命令异步执行
nnoremap <Leader>ec :call RunCurrentLine()<CR>
func! RunCurrentLine()
  let lines = getline('.')
  exec "AsyncRun ".lines
endfunc

let g:yadr_disable_solarized_enhancements = 1
let vimsettings = '~/.vim/settings'
for fpath in split(globpath(vimsettings, '*.vim'), '\n')
  exe 'source' fpath
endfor

" ================ Coc Settings Begin ========================
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" conflict with coc 0.0.82+
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> KK :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
xmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " hack for overriding vim-polyglot tags setting
  autocmd FileType * set tags=./.tags;,~/.vim/.vimtags
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>aa  <Plug>(coc-codeaction-selected)
nmap <leader>aa  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" override coc setting for buffer jumping
nnoremap <silent> <c-i> :BufSurfForward<CR>
nnoremap <silent> <c-o> :BufSurfBack<CR>
" ================ Coc Settings End ========================


" ================ Color scheme ========================

let g:enable_bold_font = 0
let g:enable_italic_font = 1

" use term bg color(black) to fix the bracket color in the float window
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
colorscheme hybrid_material
let g:lightline.colorscheme='material'

hi! CursorLine guibg=#263238 ctermbg=234
" Change Color when entering Insert Mode
autocmd InsertEnter * highlight CursorLine guibg=black ctermbg=black
" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight CursorLine guibg=#263238 ctermbg=234
