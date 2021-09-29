Plug 'AndrewRadev/splitjoin.vim' "gS gJ
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"  let g:deoplete#enable_at_startup = 1
"else
"  Plug 'Shougo/neocomplete'
"endif
"if !exists('g:gui_oni')
"  Plug 'prabirshrestha/async.vim'
"  Plug 'prabirshrestha/vim-lsp'
"  if executable('java') && filereadable(expand('~/workspace/eclipse.jdt.ls-0.41.0/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.5.500.v20190715-1310.jar'))
"      au User lsp_setup call lsp#register_server({
"          \ 'name': 'eclipse.jdt.ls',
"          \ 'cmd': {server_info->[
"          \     'java',
"          \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
"          \     '-Dosgi.bundles.defaultStartLevel=4',
"          \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
"          \     '-Dlog.level=NONE',
"          \     '-noverify',
"          \     '-Dfile.encoding=UTF-8',
"          \     '-Xmx1G',
"          \     '-jar',
"          \     expand('~/workspace/eclipse.jdt.ls-0.41.0/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.5.500.v20190715-1310.jar'),
"          \     '-configuration',
"          \     expand('~/workspace/eclipse.jdt.ls-0.41.0/org.eclipse.jdt.ls.product/target/repository/config_mac'),
"          \     '-data',
"          \     getcwd()
"          \ ]},
"          \ 'whitelist': ['java'],
"          \ })
"  endif
"endif
"let g:lsp_log_verbose=1
"let g:lsp_log_file=expand('~/tmp/vim-lsp.log')

Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

Plug 'briandoll/change-inside-surroundings.vim'
"Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'tomtom/tcomment_vim'
"CamelCase motion through words, map: <silent> [c,v,d,y...](,w ,b ,e)
Plug 'bkad/CamelCaseMotion'
"Plug 'vim-scripts/camelcasemotion'
Plug 'vim-scripts/matchit.zip'
Plug 'terryma/vim-multiple-cursors'
Plug 'Keithbsmiley/investigate.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'christoomey/vim-tmux-navigator'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'bogado/file-line'
Plug 'mattn/webapi-vim'
Plug 'sjl/gundo.vim'
"Plug 'skwp/YankRing.vim'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish'
"Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/lastpos.vim'
Plug 'vim-scripts/sudo.vim'
Plug 'goldfeld/ctrlr.vim'
"Tags in file, map in its window: <F1>, p, s, <c-n>, <c-p>, q
"Plug 'majutsushi/tagbar'
"Plug 'liuchengxu/vista.vim'
"execute whole/part of editing file, map: <F5>
Plug 'thinca/vim-quickrun'
"Plug 'Shougo/vimproc.vim'
Plug 'Shougo/vimshell.vim'
Plug 'benmills/vimux'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'janko-m/vim-test'
Plug 'ybian/smartim'
Plug 'ojroques/vim-oscyank'
