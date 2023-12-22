
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 自动缩进
filetype indent on

" 将制表符扩展为空格替代
set expandtab
" 自动进行缩进
set autoindent
" 设置编辑时Tab健的缩进长度
set tabstop=4
" or set ts=4
" 设置在编辑模式时BackSpace健的缩进长度
set softtabstop=4
" 设置每一级缩进的长度
set shiftwidth=4
" 单行最大长度 or set tw = 400
" set textwidth=300

syntax on
set fileencodings=utf-8,utf-16,gbk,big5,gb18030,latin1,utf-16le,cp1252,iso-8859-15,ucs-bom,cp936
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set gcr=a:block-blinkoff0

set t_Co=256
set background=dark
set shortmess=atl

set nocompatible "关闭兼容模式
set incsearch "开启实时搜索功能
set wildmenu "vim命令自动补全
set autoread "文件自动更新
set gcr=a:block-blinkon0 "禁止关闭闪烁
set laststatus=2 "总是显示状态栏
set ruler "显示光标位置
set number "显示行号
set relativenumber
set cursorline "高亮显示当前行
set cursorcolumn "高亮显示当前列
set hlsearch "高亮显示搜索结果
set backspace=2 "回退键生效
set novisualbell

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" nmap ;d <C-d>
" nmap ;u <C-u>
" nmap ;f <C-f>
" nmap ;b <C-b>
 
" nmap ,e :e<CR>
" nmap ,f :Files .<CR>
" nmap ,b :Buffers<CR>
" nmap ,t :Mark<CR>
" nmap ,r :Rg <C-R>=expand("<cword>")<CR><CR>

" 定义快捷键的前缀，即<Leader>
let mapleader="\<space>"

" windows opration
nnoremap <leader>l <C-W>l
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>ws :split<CR> <C-W>j
nnoremap <leader>wv :vsplit<CR> <C-W>l
nnoremap <leader>wd <C-W>c

nnoremap <leader>w :w<CR>
nnoremap <leader><Tab> <C-^>
nnoremap <leader>jg <C-]>
nnoremap <leader>jt <C-t>

call plug#begin('~/.vim/plugged')

" 可视化缩进
Plug 'Yggdroot/indentLine'
" 状态栏和标签栏
Plug 'vim-airline/vim-airline'       
Plug 'vim-airline/vim-airline-themes' "airline 的主题
" commenter
Plug 'scrooloose/nerdcommenter'
" 嵌套括号高亮
Plug 'luochen1990/rainbow'
" 树形的目录管理
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" 代码补全、静态检测、函数跳转
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 文件/函数/变量列表查找 install universal-ctags, need ctags applicatio" 
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" ctags 展示当前的文件的一些函数
Plug 'liuchengxu/vista.vim'
" nvim的一个主题
Plug 'crusoexia/vim-monokai'
" code auto pairs
Plug 'jiangmiao/auto-pairs'
" markdown
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
" github copilot: https://docs.github.com/en/copilot/getting-started-with-github-copilot?tool=vimneovim
" https://github.com/github/copilot.vim.git
Plug 'github/copilot.vim'
" 文件图标
Plug 'ryanoasis/vim-devicons'

call plug#end()

" ======> Yggdroot/indentLine <======
" 可视化缩进
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

" ======> vim-airline/vim-airline and vim-airline-themes <======
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'desertink'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <=> 切换到后一个 tab
nmap <leader>= <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>

" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR" 

" ======> preservim/nerdcommenter <======
"add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" python3 自动的会多加一个空格
au FileType python3 let g:NERDSpaceDelims = 0
 
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
 
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
 
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" 注释/反注释
nmap <leader> c<space> :NERDCommenterToggle
" 用漂亮的块格式布局注释掉所选行
nmap <leader> cs :NERDCommenterSexy
" 注释掉在视觉模式下选定的当前行或文本
nmap <leader> cc :NERDCommenterComment
" 与cc相同，但强制嵌套
nmap <leader> cn :NERDCommenterNested
" 在行尾添加注释分隔符，并在它们之间进入插入模式
nmap <leader> cA :NERDCommenterAppend
" 注释光标到行尾的当前行
nmap <leader> c$ :NERDCommenterToEOL
" 取消对选定行的注释
nmap <leader> cu :NERDCommenterUncomment

" ======> luochen1990/rainbow <======
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" ======> scrooloose/nerdtree and Xuyuanp/nerdtree-git-plugin <======
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['\.o$']  " 过滤所有.o文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <leader>tt :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键
" nnoremap <leader>ts :NERDTreeFocus<CR>
nnoremap <leader>te :NERDTree<CR>
nnoremap <leader>tf :NERDTreeFind<CR>
" nnoremap <leader>t. :NERDTreeHidden<CR>

" ======> liuchengxu/vista.vim <======
" vista.vim https://blog.csdn.net/niuiic/article/details/109158581
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
			\ 'cpp': 'coc',
			\ 'c': 'coc',
			\ 'py': 'coc',
			\ 'lua': 'coc',
			\ 'bash': 'coc',
			\ }
let g:vista_ctags_cmd = {
			\ 'haskell': 'hasktags -x -o - -c',
			\ }
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
			\   "function": "\uf794",
			\   "variable": "\uf71b",
			\  }
" nnoremap <silent><nowait> <space>m :<C-u>Vista!!<cr>
nnoremap <silent><nowait> <F8> :<C-u>Vista!!<cr>
" let g:which_key_map1.m = 'open the file tagbar'

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }

" ======> neoclide/coc.nvim seted <======
" if hidden is not set, TextEdit might fail.
"set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
"set shortmess+=c
" always show signcolumns
set signcolumn=yes
 
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
 
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
 
" Use `gN` and `gn` to navigate diagnostics
nmap <silent> gN <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
 
" Use K to show documentation in preview window
nnoremap <silent> gk :call <SID>ShowDocumentation()<CR>
 
function! s:ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
 
" <Leaderf>gv 改名，<Leaderf>gR 重构
nmap <leader>gv <Plug>(coc-rename)
nmap <Leader>gR <Plug>(coc-refactor)
 
" Remap for format selected region
xmap <leader>gf  <Plug>(coc-format-selected)
nmap <leader>gf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
 
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>ga  <Plug>(coc-codeaction-selected)
nmap <leader>ga  <Plug>(coc-codeaction-selected)
 
" Remap for do codeAction of current line
nmap <leader>gC  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>gF  <Plug>(coc-fix-current)
 
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
 
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" use Prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let s:current_python3_path=$CONDA_PREFIX.'/bin/python3'
call coc#config('python3', {'pythonPath': s:current_python3_path})

let g:coc_global_extensions = [
 \    'coc-html', 
 \    'coc-css', 
 \    'coc-tsserver', 
 \    'coc-json', 
 \    'coc-snippets', 
 \    'coc-highlight', 
 \    'coc-pairs', 
 \    'coc-vetur', 
 \    'coc-prettier' ,
 \    'coc-emmet',
 \    'coc-yank',
 \    'coc-clangd',
 \    'coc-java', 
 \    'coc-sh',
 \    'coc-pyright',
 \    'coc-lua',
 \    'coc-markdownlint',
 \    'coc-cmake',
 \    'coc-git',
 \    'coc-yaml',
 \    'coc-syntax',
 \]

" ======> Yggdroot/LeaderF <======
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fh :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fc :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
" nmap <leader>ff :LeaderfFile<CR>
" nmap <leader>fc :LeaderfFunction<CR>
" nmap <leader>fb :LeaderfBuffer<CR>
" nmap <leader>fh :LeaderfBufTag<CR>
" nmap <leader>fm :LeaderfMru<CR>
" nmap <leader>fl :LeaderfLine<CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap ff :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap fo :<C-U>Leaderf! rg --recall<CR>

" ======> crusoexia/vim-monokai <======
colo monokai

" ======> iamcco/markdown-preview.nvim <======
nnoremap <silent><nowait> <F3> :MarkdownPreview<CR> "设置 F3 开启 Markdown 文件预览
nnoremap <silent><nowait> <F5> :MarkdownStop<CR> "设置 F3 开启 Markdown 文件预览
nnoremap <silent><nowait> <F4> :MarkdownToggle<CR> "设置 F3 开启 Markdown 文件预览
let g:mkdp_auto_start = 0 "打开文件后自动弹出, 0 为否
let g:mkdp_auto_close = 1 "关闭文件后自动关闭预览窗口, 1 为是
let g:mkdp_refresh_slow = 1 "慢速预览, 修改后退出 insert 模式后方会刷新视图, 1 为是
let g:mkdp_open_to_the_world = 0 "开启公网链接, 0 为否
let g:mkdp_browser = '' "指定浏览器, 默认会跟随系统浏览器
let g:mkdp_port = '' " 指定端口, 默认随机端口
let g:mkdp_page_title = ' **${name}** ' "指定浏览器窗口标题, 默认为 Markdown 文件名

" termain
nnoremap <M-h> <c-w>h 
nnoremap <M-j> <c-w>j 
nnoremap <M-k> <c-w>k 
nnoremap <M-l> <c-w>l 
if has('nvim')
    tnoremap <M-h> <c-\><c-n><c-w>h
    tnoremap <M-j> <c-\><c-n><c-w>j
    tnoremap <M-k> <c-\><c-n><c-w>k
    tnoremap <M-l> <c-\><c-n><c-w>l
endif
