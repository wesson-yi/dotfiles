" DONE: 打开目录并定位当前文件后，再次调用，无法关闭目录，故不再启用此项。已使用自定义函数替代
" 在目录中定位当前文件（会自动打开目录）
" nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical res 30<CR>

" 简化显示NERDTree，去除顶部的提示信息等
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" 设置默认宽度
let g:NERDTreeWinSize = 30

" 打开文件，自动关闭 NERDTree
" let g:NERDTreeQuitOnOpen = 1
" 在终端启动 vim 时，共享NERDTree
" let g:nerdtree_tabs_open_on_console_startup = 1

" 是否显示隐藏文件
" let NERDTreeShowHidden = 1
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
" let NERDTreeShowBookmarks = 1

" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
" autocmd VimEnter * NERDTree

" 按下 F2 调出/隐藏 NERDTree
" map <F2> :silent! NERDTreeToggle

" 关闭vim时，如果打开的文件只有NERDTree，则自动关闭
" 添加此项，autopairs 无法工作，而且此功能已经具备
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q |

" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
" let NERDTreeWinPos="right"
