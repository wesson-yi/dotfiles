" Open the project tree and expose current file in the nerdtree with Ctrl-\
nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical res 30<CR>

" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" 打开文件，自动关闭 NERDTree
" let g:NERDTreeQuitOnOpen = 1

" nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical res 40<CR>
" let g:NERDTreeWinSize = 30
" let g:NERDTreeWinSize = 30

" ==================== modefied by wesson.yi

" 设置宽度
" let g:NERDTreeWinSize                       = 40
" 是否显示隐藏文件
" let NERDTreeShowHidden                      = 1
" 显示书签列表
" let NERDTreeShowBookmarks                   = 1
" 在终端启动 vim 时，共享NERDTree
" let g:nerdtree_tabs_open_on_console_startup = 1

" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
" autocmd VimEnter * NERDTree

" 按下 F2 调出/隐藏 NERDTree
" map <F2> :silent! NERDTreeToggle

" 关闭vim时，如果打开的文件只有NERDTree，则自动关闭
" 添加此项，autopairs 无法工作，而且此功能已经具备
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q |

" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
" let NERDTreeWinPos="right"

" 当打开 NERDTree 窗口时，自动显示 Bookmarks
" let NERDTreeShowBookmarks=1

" ==================== modefied by wesson.yi
