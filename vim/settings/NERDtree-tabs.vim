let g:nerdtree_tabs_open_on_gui_startup = 1
" HACK: 右侧闪现目录并关闭，与 NerdTree 官方提供的方案类似
" 自动打开 NERDTree，如果使用命令类似 vim .
let g:nerdtree_tabs_open_on_console_startup = 2
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_open_on_new_tab = 1
nnoremap <silent> <Leader>w= :wincmd =<CR>
nnoremap <silent> <Leader>wr :NERDTreeToggle<CR>:wincmd r<CR>:NERDTreeToggle<CR>
nnoremap <silent> <Leader>wR :NERDTreeToggle<CR>:wincmd R<CR>:NERDTreeToggle<CR>
nnoremap <silent> <Leader>wK :NERDTreeToggle<CR>:wincmd K<CR>:NERDTreeToggle<CR>
nnoremap <silent> <Leader>wJ :NERDTreeToggle<CR>:wincmd J<CR>:NERDTreeToggle<CR>
nnoremap <silent> <Leader>wH :NERDTreeToggle<CR>:wincmd H<CR>:NERDTreeToggle<CR>
nnoremap <silent> <Leader>wL :NERDTreeToggle<CR>:wincmd L<CR>:NERDTreeToggle<CR>
