" vimrc by @windvalley
" https://raw.githubusercontent.com/windvalley/dotfiles/master/vim/vimrc


" vim: set foldmarker={{,}} foldlevel=0 foldmethod=marker:
"
" 查看折叠内容的方法:
"    za: normal 模式下按`za`, 表示当光标在关闭折叠上时打开之, 在打开折叠上时关闭之;
"        在打开的折叠内部任意处按`za`, 也会关闭折叠.
"    zA: 是`za`的递归操作, 是针对嵌套折叠的场景.


" 安装步骤 {{

" 一. 安装 VIM 及依赖:
"    1. macOS 系统
"    # 用于目录树文件图标显示的依赖安装
"    brew tap homebrew/cask-fonts && brew install font-hack-nerd-font
"
"    # 从 insert 切换到 normal 模式时自动切换输入法功能需要的系统依赖安装:
"    git clone https://github.com/myshov/xkbswitch-macosx.git
"    cp xkbswitch-macosx/bin/xkbswitch /usr/local/bin/
"    git clone https://github.com/myshov/libxkbswitch-macosx
"    cp libxkbswitch-macosx/bin/libxkbswitch.dylib /usr/local/lib/
"
"    # macvim 安装
"    brew install cmake python mono go nodejs yarn
"    brew install ctags rg
"    brew install macvim
"
"    2. Linux 系统
"    # 用于目录树文件图标显示
"    mkdir -p ~/.local/share/fonts
"    cd ~/.local/share/fonts && \
"       curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" \
"       https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
"
"    1) CentOS7
"    sudo yum -y remove vim-common vim-enhanced vim-filesystem
"    sudo yum -y install gcc-c++ make ncurses ncurses-devel python3 ctags git
"    sudo yum -y install epel-release && yum -y install golang
"    # https://www.mono-project.com/download/stable/#download-lin-centos
"    sudo yum -y install mono-devel
"    curl -fsSL https://rpm.nodesource.com/setup_15.x | bash -
"    sudo yum -y install nodejs  # node & npm
"    sudo yum -y install tcl-devel ruby ruby-devel lua lua-devel luajit luajit-devel \
"       python3 python3-devel perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp \
"       perl-ExtUtils-CBuilder perl-ExtUtils-Embed
"    git clone https://github.com/vim/vim.git
"    cd vim
"    ./configure --with-features=huge --enable-multibyte --enable-python3interp \
"       --enable-rubyinterp --enable-perlinterp --enable-luainterp
"    make && sudo make install
"
"    2) Ubuntu
"    apt install build-essential cmake vim-nox python3-dev
"    apt install mono-complete golang nodejs default-jdk npm

" 二. 注意事项:
"    * VIM 版本要求在 8.2+, 可通过`vim --version`查看.
"    * 为了支持 python3 和复制粘贴的便利, 需要 VIM 支持 python3 和 clipboard, 可通过
"      `vim --version|grep -Eo '\+python3|\+clipboard'`查看是否有相关输出,
"      没有的话请重新编译安装.
"    * `vimrc`默认集成了 Go 开发插件`vim-go`, 需要系统已经有 Go 环境,
"      并配置 Go 代理解决墙的问题.
"    * macOS 和 Linux 系统可正常使用, Windows 系统未测试.

" 三. 配置步骤:
"    1. 备份原有的 ~/.vimrc 和 ~/.vim/ 等相关文件和目录:
"       mv ~/.vimrc ~/.vimrc.$(date +%F_%T)
"       mv ~/.vim ~/.vim.$(date +%F_%T)

"    2. 替换你的当前 ~/.vimrc 文件:
"       wget -O ~/.vimrc https://raw.githubusercontent.com/windvalley/dotfiles/master/vim/vimrc

"    3. 安装用于管理 VIM 插件的插件`vim-plug`:
"       curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"    4. 安装 vimrc 中已配置的 VIM 插件:
"       vim +PlugInstall +qa

" }}


" 基础环境 {{

" 关闭兼容模式, 也就是不再兼容 VI, 必需放在第一行.
set nocompatible

" 设置 VIM 内部使用的字符编码, 默认值 latin1 或者操作系统 $LANG 环境变量对应的编码.
set encoding=utf-8

" VIM 保存多少个历史命令, 一般保存在 ~/.viminfo 隐藏文件中.
set history=1000

" 如果过了这么多毫秒数以后还没有任何输入, 则把交换文件写入磁盘,
" 也用于 CursorHold 自动命令事件.
" 默认值: 4000(毫秒)
set updatetime=100

" 打开文件类型检测, 允许插件文件载入, 允许缩进文件载入.
filetype plugin indent on

" 重新设置 leader 键, 即一些自定义命令的前缀, 默认值: '\'
let mapleader = ','

" }}


" 插件安装 {{

" 需要先安装用于管理 VIM 插件的插件: vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" 下面每一个 Plug 对应一个 VIM 插件, 插件名称就是相应 github 项目名称,
" 可通过访问 https://github.com/插件名称 来查看相关插件的详细使用文档;
" 也可以通过 command-line 模式 :help 插件名称 来查看相关插件文档.
call plug#begin('~/.vim/plugged')


" ********************** VIM 主题 ********************************************

" solarized
Plug 'altercation/vim-colors-solarized'

" gruvbox
Plug 'morhetz/gruvbox'

" molokai
Plug 'tomasr/molokai'

" Atom theme: One Dark / Light
Plug 'rakr/vim-one'

" dracula
Plug 'dracula/vim', { 'as': 'dracula' }

" ********************** 代码补全 ********************************************

" 速度更快, 体验更优且支持更多编程语言的代码补全平台.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 为 coc-ultisnips 提供代码片段源.
Plug 'SirVer/ultisnips'

" 为 coc-snippets 提供代码片段源.
Plug 'honza/vim-snippets'

" 为 viml 脚本语言提供补全支持.
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'

" ********************** 代码检查 ********************************************

" 代码静态检查与自动修复插件: ALE(Asynchronous Lint Engine)
Plug 'dense-analysis/ale'

" ********************** GUI *************************************************

" 目录树窗口插件.
Plug 'preservim/nerdtree'

" 使目录树支持 git 的插件.
Plug 'Xuyuanp/nerdtree-git-plugin'

" 为正在编辑的文件生成大纲视图, 包括接口/方法/变量等,
" 可选中快速跳转, 适合单个文件代码较多的场景.
" 需要先在系统命令行安装 ctags, 比如如果是 macOS 系统, 则: brew install ctags
Plug 'majutsushi/tagbar'

" 深度集成 git 的插件.
Plug 'tpope/vim-fugitive'

" git 历史版本的浏览插件, 该插件依赖 vim-fugitive 插件.
Plug 'junegunn/gv.vim'

" 在文件窗口左侧标记列显示内容变化的行.
" NOTE: 这里只使用到此插件的配色, 为 coc-git 提供标记的配色.
Plug 'airblade/vim-gitgutter'

" 美化状态栏插件.
Plug 'itchyny/lightline.vim'

" 为 lightline 插件提供显示 ale 检查出来的错误或警告的统计信息;
" 另外安装此插件可以解决 vim 打开文件同时显示目录树窗口的场景时,
" 无法正常加载 lightline 状态栏的问题.
Plug 'maximbaz/lightline-ale'

" 彩虹括号插件, 层级较多的括号场景使用不同颜色区分.
Plug 'luochen1990/rainbow'

" 为目录树或LeaderF等插件显示文件类型.
" NOTE:
" 1) 需安装 nerd-fonts, 并设置iterm2 的字体为: Hack Nerd Font 或 Hack Nerd Font Mono;
"    # doc: https://github.com/ryanoasis/nerd-fonts#font-installation
"    brew tap homebrew/cask-fonts && brew install font-hack-nerd-font
" 2) 此插件要安装在目录树 或 LeaderF 等插件的后面.
Plug 'ryanoasis/vim-devicons'

" 在上一个插件的基础上, 根据文件类型的不同, 改变图标的颜色.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" 悬浮终端插件.
Plug 'voldikss/vim-floaterm'

" 显示缩进线插件.
Plug 'Yggdroot/indentLine'

" ********************** 编程语言 ********************************************

"""""""" Go
" 搭建 Go 开发环境的 VIM 插件, 安装该插件的过程中,
" 会自动安装该插件依赖的大量 Go 二进制工具;
" 如果由于 Go 环境等问题导致自动安装失败,
" 可后续通过 VIM 的 command-line 模式安装`:GoInstallBinaries`.
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"""""""" openresty
" 提供 nginx/openresty 语法高亮与指令补全.
Plug 'spacewander/openresty-vim'

"""""""" javascript/html/css/vue/json
" 前端利器 html/css/js
Plug 'mattn/emmet-vim'

" 高亮 jsonc 类型文件, 有此插件就可以对 json 进行注释了.
Plug 'neoclide/jsonc.vim'

"""""""" markdown
" 通过浏览器实时预览 Markdown 文本的插件.
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}

" 在 markdown 中高效编辑表格.
Plug 'dhruvasagar/vim-table-mode'

"""""""" toml
" toml 语法高亮插件.
Plug 'cespare/vim-toml'

" ********************** 效率相关 ********************************************

" 快速打开想要的文件, 类似grep搜索文件内容等, 替代ctrlp插件.
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" 方便注释的插件, normal 模式下或 visual 模式下:
" `, c <space>` 注释或取消注释选中的代码.
Plug 'preservim/nerdcommenter'

" 光标高效跳转插件.
Plug 'easymotion/vim-easymotion'

" 使用指定符号(比如 ' 等)包围光标所在单词,
"    `ys2w"`, 表示从光标位置开始的2个单词使用 " 包围;
"    `ds"`, normal 模式下删除光标周围的双引号 ";
"    `cs"'`, normal 模式下把光标所在周围的双引号 " 替换为单引号 '.
Plug 'tpope/vim-surround'

" 多光标批量操作文本对象插件.
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" 自动补全引号(单引号/双引号/反引号)、括号(小括号/中括号/大括号)的插件.
Plug 'Raimondi/delimitMate'

" 复制文本对象的时候, 高亮显示复制的文本对象.
Plug 'machakann/vim-highlightedyank'

" 为行内跳转指令 f F t T 提供高亮字符显示.
Plug 'unblevable/quick-scope'

" 切换到 normal 模式时切换到英文输入法.
Plug 'lyokha/vim-xkbswitch'

" 在 .tmux.conf 中直接通过 K 查看 tmux 文档等功能.
Plug 'tmux-plugins/vim-tmux'

" VIM 从菜鸟到高手之路必备, 禁止连续按 jkhl 等低效操作,
" 强制你根据不同场景来思考使用更高效的命令的习惯.
Plug 'takac/vim-hardtime'

" ********************** 其他 ************************************************

" 日历插件.
" doc: https://github.com/itchyny/calendar.vim
Plug 'itchyny/calendar.vim'


" 最后 command-line 模式下执行 :PlugInstall 自动安装上面未安装的插件, 其他常用命令:
"    :PlugStatus  查看当前状态, 安装进度等;
"    :PlugUpdate  更新所有插件, 建议定期更新所有插件;
"    :PlugClean   卸载插件, 需要先在上面注释掉或删除相关插件,
"                 然后重新打开此文件或 normal 模式下按 ,R 执行此命令;
"    :PlugUpgrade  更新 vim-plug 本身.
call plug#end()

" }}


" 代码自动补全 {{

"""""""" neoclide/coc.nvim
" CoC 的全称是: Conqure of Completion
" doc: https://github.com/neoclide/coc.nvim
"

" *** 基本命令 ***
"                  :CocInfo  补全服务启动失败原因查看.
"               :CocOpenLog  查看补全服务的日志.
"                :CocConfig  打开 ~/.vim/coc-settings.json.
"                            NOTE: 已映射快捷键 :C
"       :CocList extensions  查看安装了哪些扩展, 通过 ctrl k/j 上下滚动查看:
"                            * 表示激活的扩展;
"                            + 表示已经加载的扩展;
"                            - 表示禁用的扩展;
"                            ? 表示不正常的扩展.
"                            选中某一个扩展后, 按 tab 键将会提示相应的操作.
"                            NOTE: 已映射快捷键 space e
"      :CocInstall coc-json  安装 Json language server.
"    :CocUninstall coc-json  卸载 Json language server.
"                :CocUpdate  更新所有扩展.
"          :CocList sources  列出当前已经有哪些代码补全的数据源.
" ************************************************

" *** 补全菜单的符号说明 ***
"   [LS]  Language Server, 补全来自语言服务器.
"    [S]  Snippets, 补全来自 Snippets.
"   [US]  UltiSnips, 补全来自 UltiSnips.
"  [GOC]  Gocode, 补全来自 gocode.
"  [NEC]  Neco-vim, 补全来自 Shougo/neco-vim 插件.
"    [A]  Around, 补全来自当前文件(buffer).
"    [B]  Buffer, 补全来自其他已经打开的文件(buffer).
"    [F]  File, 补全来自文件名自动检测.
"      M  Module, 此条补全是一个模块.
"      I  Interface, 是一个接口.
"      S  Struct, 是一个结构体.
"      f  func, 是一个函数.
" **************************

" 设置隐藏模式, 未保存的buffer(文件)可以被切换走或者关闭;
" 如果不设置这个, TextEdit 可能失败.
set hidden

" 底部命令模式的显示高度, 默认值1.
" 设置为2是为了给提示信息更多的展示空间, 防止信息截断.
set cmdheight=2

" 不要将信息传递给 ins-completion-menu.
set shortmess+=c

" *** coc.nvim 扩展安装 ***
" 将需要安装的 coc.nvim 扩展(语言服务器等) 放到数组中,
" 打开 vim 时, coc.nvim 会自动对扩展进行自动安装.
" doc: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
" 部分扩展说明:
"   coc-jedi: Python3.6.1+
"   coc-css: Css/Less/Sass
"   coc-vetur: 需要在 vue 项目根路径下运行: npm i eslint eslint-plugin-vue -D
"   coc-snippets: 需要安装 vim 插件: Plug 'honza/vim-snippets'
"   coc-ultisnips: 需要安装 vim 插件: Plug 'SirVer/ultisnips'
"   coc-gocode: 为 Go 提供代码片段补全的数据库.
"   coc-emoji: Emoji words, 默认只对 markdown 类型文件开启, 通过 : 触发.
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-git',
	\ 'coc-go',
	\ 'coc-gocode',
	\ 'coc-rls',
	\ 'coc-clangd',
	\ 'coc-jedi',
	\ 'coc-java',
    \ 'coc-sh',
    \ 'coc-perl',
	\ 'coc-tsserver',
	\ 'coc-css',
	\ 'coc-cssmodules',
    \ 'coc-emmet',
	\ 'coc-html',
	\ 'coc-vetur',
    \ 'coc-sql',
    \ 'coc-toml',
    \ 'coc-yaml',
    \ 'coc-xml',
    \ 'coc-vimlsp',
	\ 'coc-snippets',
	\ 'coc-ultisnips',
	\ 'coc-emoji',
	\ 'coc-swagger',
    \ 'coc-translator',
	\ ]
" *************************

" *** ~/.vim/coc-settings.json ***
"   该配置文件可对 coc.nvim 以及安装的各种扩展进行个性配置,
"   如果已经安装了 coc-json 扩展, 则该配置文件将支持自动补全和合法性检查,
"   方便我们进行配置.

" :C  打开 ~/.vim/coc-settings.json 配置文件.
function! SetupCommandAbbrs(from, to)
    exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
call SetupCommandAbbrs('C', 'CocConfig')
" ****************************************************************************

" *** coc-translator
" doc: https://github.com/voldikss/coc-translator
" normal 和 visual 模式下, 将光标下的单词以弹出漂浮窗口的方式显示翻译结果.
nmap ts <Plug>(coc-translator-p)
vmap ts <Plug>(coc-translator-pv)
" 在状态栏下面显示翻译的结果.
nmap tse <Plug>(coc-translator-e)
vmap tse <Plug>(coc-translator-ev)
" 将翻译结果替换掉光标下的单词.
nmap tsr <Plug>(coc-translator-r)
vmap tsr <Plug>(coc-translator-rv)
" ******************

" *** coc-css
autocmd FileType scss setl iskeyword+=@-@
" ***********

" 使用 tab 键触发补全, 选择补全.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 使用 <CR>(回车键) 来自动选择补全条目的第一条并格式化代码.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" SirVer/ultisnips 插件触发补全的默认配置是 tab 键, 会和 coc 的冲突, 需要修改掉.
" 实际上并不会用到这里设置的快捷键.
let g:UltiSnipsExpandTrigger="<Leader>,,,f"

" gd  跳转到定义处.
nmap <silent> gd <Plug>(coc-definition)
" gy  跳转到类型定义处.
nmap <silent> gy <Plug>(coc-type-definition)
" gi  跳转到实现处.
nmap <silent> gi <Plug>(coc-implementation)
" gr  在 location list 中列出相关条目, 如果相关的只有1条, 则直接跳转过去.
nmap <silent> gr <Plug>(coc-references)

" ,rn  级联的进行重命名.
nmap <leader>rn <Plug>(coc-rename)

" visual 和 normal 模式下对选中的代码进行格式化.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" 使用 K 在预览窗口中查看文档.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  " 使支持 tmux-plugins/vim-tmux 插件.
  elseif (index(['tmux'], &filetype) >= 0)
    call tmux#man()
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" 使用 <C-f> 和 <C-b> 在悬浮窗口向下翻页和向上翻页, 比如在查看较长的文档时使用.
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" *** CocList 相关命令快捷键映射 ***
" NOTE: 按快捷键出现相关列表后, 使用 ctrl j/k/f/b 进行浏览, 使用 tab 进行管理.
"
" space e  列出所有扩展.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" space c  列出所有命令.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" space s  列出当前所在文件类型有哪些代码补全数据源.
nnoremap <silent><nowait> <space>s  :<C-u>CocList sources<cr>
" space p  重新列出上一次展示的 CocList.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" **********************************
""""""""""""""""""""""""""

"""""" ycm-core/YouCompleteMe 已注释, 不再使用 {{
"" doc: https://github.com/ycm-core/YouCompleteMe
"" NOTE: YCM 很强大, 但也有很多缺点目前无法克服, 比如:
""       1) 选择补全的时候会出现卡顿, 严重影响体验;
""       2) 不支持悬浮窗口;
""       3) 很多语言不支持等.
""       故不再使用 YCM, 使用 coc.nvim 来替代.

"" gd 跳转到函数定义处, 然后可以通过 ctrl o/i 来回跳转;
"" 支持的文件类型:
""    c, cpp, objc(object-c), objcpp, cuda, cs(c#), go, java, javascript, python, rust, typescript
""    NOTE: gd 快捷键已被 go-vim 插件的配置占用来实现类似能力, 此处的配置对 Go 不起作用.
""
"" 如果 ycm_goto_buffer_command 设置了非 same-buffer 的值, 默认是在窗口上方分屏跳转.
""map gd :YcmCompleter GoTo<CR>
"" 新打开标签页的方式跳转, 需要 ycm_goto_buffer_command 设置非 same-buffer 的值, 否则不会打开新的标签页.
"map gd :tab YcmCompleter GoTo<CR>
"" 右侧分屏的方式跳转, 需要 ycm_goto_buffer_command 设置非 same-buffer 的值, 否则不会分屏跳转.
""map gd :rightbelow vertical YcmCompleter GoTo <CR>

"" gr 跳转到引用当前光标所在对象的位置, 会列出引用光标所在对象的所有文件,
"" 然后我们选择一个文件名回车, 即可跳转到引用位置.
"" 支持的文件类型:
""    c, cpp, objc, objcpp, cuda, java, javascript, python, typescript, rust, 官方没写支持Go, 但实测支持Go.
"map gr :YcmCompleter GoToReferences<CR>

"" 以什么方式打开 gd 命令跳转的位置.
"" 默认值: 'same-buffer'
""    'same-buffer': 覆盖当前窗口;
""    'split-or-existing-window': 如果要跳转的位置之前已经打开了一个标签页,
""                                就直接跳转到那个已经打开的页面, 否则新打开一个标签页;
""    'split': 不管要跳转的位置之前有没有已经打开了, 都再新打开一个标签页.
"let g:ycm_goto_buffer_command = 'split-or-existing-window'

"" 基于语义补全的快捷键:
"" 语义补全非字符补全, 字符补全是根据当前所有 buffer 中收集到的符号来提示,
"" 符号补全只有一个符号名, 不能像语义补全一样给出参数格式, 返回值等丰富信息;
""
"" 默认是用 CTRL+SPACE 来触发语义补全的, 中文操作系统下,
"" CTRL+SPACE 被系统劫持用作输入法切换, 无法正确传到终端, 所以需要自定义 CTRL+l,
"" 有了这个快捷键, 就解决了只能通过`.`号来触发语义补全的局限性了.
"let g:ycm_key_invoke_completion = '<c-l>'

"" 自动语义补全配置, 无需按 ctrl l 即可自动做语义补全提示:
"" 默认的 . / -> / :: 语义补全触发符号是不会被覆盖的, 只会追加成新的 trigger,
"" 这里我们追加了一个正则表达式, 代表相关语言的源文件中, 用户只需要输入1个字母, 即可自动弹出语义补全.
"let g:ycm_semantic_triggers =  {
"\    'go,python,lua': ['re!\w{1}'],
"\    'javascript,typescript': ['re!\w{1}'],
"\    'c,cpp,java,rust,erlang,perl,perl6': ['re!\w{1}'],
"\ }

"" 表示是否将你的编码进行记录, 用来在后续的编码过程中进行相关的补全提示.
"" 默认值: 0
"let g:ycm_seed_identifiers_with_syntax = 1

"" 从键入第几个字符开始进行自动匹配提示.
"" 默认值: 2
"let g:ycm_min_num_of_chars_for_completion = 1

"" 是否从注释中输入时也能补全.
"" 默认值: 0
"let g:ycm_complete_in_comments = 1

"" 是否在字符串中输入时也能补全.
"" 默认值: 1
"let g:ycm_complete_in_strings = 1

"" 注释和字符串中的文字是否也被收入到补全数据库中.
"" 默认值: 0
"let g:ycm_collect_identifiers_from_comments_and_strings = 1

"" 如果值为空, 则表示禁用此功能.
"" 默认值是: CursorHold, 表示光标停留在函数一小会儿后自动展示文档;
"let g:ycm_auto_hover = 'CurorHold'

"" 设置此 map 后, 上面的 let g:ycm_auto_hover = 'CurorHold' 功能自动失效, 需要通过`,D`来触发文档显示.
"nmap <leader>D <plug>(YCMHover)

"" 是否启用 YCM 提供的代码静态检查功能, 由于我们使用了 ale 来做静态代码检查, 所以这里禁用.
"" 默认值: 1
"let g:ycm_show_diagnostics_ui = 0
""""""""""""""""""""""""""" }}

" }}


" 代码静态检查 {{

" ale 用于替代 syntastic 插件.
" NOTE: :ALEInfo  用于查看当前文件的语法检查配置情况,
" 内容尾部是对当前文件内容执行检查的日志, 可通过这些日志排查问题.
" doc: https://github.com/dense-analysis/ale

" 定制显示在行左侧的错误提示符和警告提示符.
" 默认值: '>>'
let g:ale_sign_error = '>>'
" 默认值: '--'
let g:ale_sign_warning = '--'

" 左侧的错误/警告提示列是否一直保持打开, 默认值: 0
let g:ale_sign_column_always = 0

" 用于错误或警告提示的字符串.
" 默认值: 'Error'
let g:ale_echo_msg_error_str = 'Error'
" 默认值: 'Warning'
let g:ale_echo_msg_warning_str = 'Warning'

" 设置提示信息的输出格式, 默认值: '%code: %%s'
let g:ale_echo_msg_format = '[%linter%] %code: %%s [%severity%]'

" 是否将 ale linter 发现的错误或警告的具体位置列表信息添加到 location list 中.
" 我们这里禁用, 以防止使用 gr 时, 破坏 gr 使用的 location list.
" 默认值: 1
let g:ale_set_loclist = 0

" 如果 location list 不为空, 是否打开一个独立的窗口显示其信息, 默认值: 0
let g:ale_open_list = 0
" 错误信息窗口的高度, 在 g:ale_open_list 设置为1时才有效果, 默认值: 10
let g:ale_list_window_size = 5

" 错误或警告信息全部修复后, 是否保留错误信息窗口, 1 表示保留, 默认值: 0
let g:ale_keep_list_window_open = 0

" 退出文件时, 如果仅剩错误信息窗口, 则其也一同退出(loclist).
augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" 新打开文件时是否自动 lint, 默认值: 1
let g:ale_lint_on_enter = 1

" 保存文件时是否进行 lint, 默认值: 1
let g:ale_lint_on_save = 1

" 保存文件时是否进行 fix,  默认值: 0
let g:ale_fix_on_save = 1

" , k/j 在错误提示之间跳转.
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

" 针对不同语言的静态代码检查工具配置.
" NOTE:
"   1) 其他没有在这里配置的语言将使用 ale 默认配置的 linter,
"      可以使用 :ALEInfo 来查看当前文件使用了哪些默认的 linter.
"
"   2) 注意需要在本地安装涉及到的命令行工具:
"      brew install golangci-lint lua luarocks tidy-html5 shellcheck jq
"      luarocks install luacheck
"      npm install -g eslint standard eslint-plugin-vue vls \
"          proselint alex write-good stylelint markdownlint jsonlint
"      pip3 install pylint flake8 yamllint
"      go get github.com/golangci/golangci-lint/cmd/golangci-lint@v1.39.0
"      go get -u github.com/mgechev/revive
"      sudo gem install mdl
"
"   3) eslint 配置文件, 项目根目录下的 .eslintrc.json, 需要通过如下命令生成,
"      我们这里使用 standard 风格: eslint --init
"      或 vue create project-demo(需要选择手动配置, 选择standard风格),
"      将配置生成到 package.json 的 eslintConfig 字段.
"
"   4) prettier 配置文件, 项目根目录下的 .prettierrc.json:
"      {
"        "singleQuote": true,
"        "semi": false
"      }
"
"   5) 对于Python项目, 如果使用虚拟环境, 需要在虚拟环境下安装相关 linter 工具,
"      拿 Python 的依赖管理工具 poetry 举例:
"      poetry init
"      poetry shell
"      poetry add pylint flake8 autoimport black isort -D
let g:ale_linters = {
    \    'go': ['golangci-lint', 'revive', 'gopls'],
    \    'python': ['pylint', 'flake8'],
    \    'lua': ['luac', 'luacheck'],
    \    'sh': ['shellcheck', 'language_server'],
    \    'javascript': ['eslint', 'standard'],
    \    'vue': ['eslint', 'vls'],
    \    'html': ['tidy', 'stylelint', 'alex', 'writegood', 'proselint'],
    \    'yaml': ['yamllint'],
    \    'json': ['jq', 'jsonlint'],
    \    'jsonc': ['jq', 'jsonlint'],
    \    'markdown': ['mdl', 'markdownlint', 'proselint', 'alex'],
    \ }

" 覆盖掉 ~/.vim/plugged/ale/ale_linters/go/golangci_lint.vim 中的个别默认配置;
" golanci-lint run 命令不加额外参数, 解决默认加的 --enable-all 参数导致的错误.
call ale#Set('go_golangci_lint_options', '')

" golangci-lint run 命令以包为单位进行检查,
" 解决默认以文件方式检查时的 typecheck 错误误报的问题.
call ale#Set('go_golangci_lint_package', 1)

" 针对不同语言的自动修复功能.
"    需要安装相关的命令行工具:
"       npm install -g prettier importjs lua-fmt
"       pip3 install black isort
"       go get mvdan.cc/sh/v3/cmd/shfmt
"
" NOTE:
"   1) 不要使用 python 的 autoimport 工具, 重新排版的 import 可能发生错误;
"      用于 python 的 isort, 可选择性使用, 我这里也不启用,
"      直接用 black 的 import 排版能力即可.
"   2) lua 的 luafmt 可进行自动格式化, 由于其格式化效果不符合我的审美要求,
"      我这里暂不启用.
"   3) prettier 等工具自身就有 trim_whitespace 和 remove_trailing_lines 的能力,
"      所以不用重复添加.
let g:ale_fixers = {
    \    'python': ['black', 'add_blank_lines_for_python_control_statements'],
    \    'lua': ['trim_whitespace', 'remove_trailing_lines'],
    \    'sh': ['shfmt'],
    \    'javascript': ['eslint', 'importjs'],
    \    'vue': ['eslint'],
    \    'html': ['prettier'],
    \    'json': ['jq'],
    \    'jsonc': ['jq'],
    \    'yaml': ['prettier'],
    \    'markdown': ['prettier'],
    \ }

" }}


" 状态栏定制 {{

"""""" itchyny/lightline.vim
" doc: https://github.com/itchyny/lightline.vim

" 本选项的值影响最后一个窗口何时有状态行:
"     0: 永不
"     1: 只有在有至少两个窗口时
"     2: 总是
" 默认值: 1, 为了单窗口也可以显示状态栏, 此处设置为2.
set laststatus=2

" 由于此插件已经帮我们美化显示了当前的 VIM 模式, 所以 VIM 自带的模式显示可以去除.
set noshowmode
"""""""""""""""""""""""""""

"""""" 'maximbaz/lightline-ale'
" doc: https://github.com/maximbaz/lightline-ale

" 美化错误与警告等信息的显示图标.
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_ok = "\uf00c"
" 以下三条指令的字符串值结尾多一个空格, 用来解决图标和数字重叠的问题.
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "

let g:lightline = {}

let g:lightline.component_expand = {
    \  'linter_checking': 'lightline#ale#checking',
    \  'linter_infos': 'lightline#ale#infos',
    \  'linter_warnings': 'lightline#ale#warnings',
    \  'linter_errors': 'lightline#ale#errors',
    \  'linter_ok': 'lightline#ale#ok',
    \ }

let g:lightline.component_type = {
    \  'linter_checking': 'right',
    \  'linter_infos': 'right',
    \  'linter_warnings': 'warning',
    \  'linter_errors': 'error',
    \  'linter_ok': 'right',
    \ }

" 已从 left 中去除 cocstatus, 可选择性加入.
let g:lightline.active = {
    \  'left': [ [ 'mode', 'paste' ],
    \            [ 'git', 'bgit', 'method', 'readonly', 'filename', 'modified' ],
    \  ],
    \  'right': [ [ 'lineinfo' ],
    \             [ 'percent' ],
    \             [ 'fileformat', 'fileencoding', 'filetype' ],
    \             [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
    \             [ 'blame' ],
    \  ],
    \ }

let g:lightline.component_function = {
   \  'cocstatus': 'coc#status',
   \  'git': 'LightlineGitStatus',
   \  'bgit': 'LightlineBufferGitStatus',
   \  'blame': 'LightlineGitBlame',
   \ }

" doc: https://github.com/neoclide/coc-git
"   *  表示 git 仓库内容有变更;
"   x  表示 git 仓库内容有冲突;
"   ●  表示 git 新增或变化内容已经提交到暂存区;
"   …  表示 git 仓库内有未跟踪的新文件;
"   以上符号可同时在分支后显示, 如果分支名称后没有任何上述符号, 说明分支是干净的.
function! LightlineGitStatus() abort
  let gstatus = get(g:, 'coc_git_status', '')
  return gstatus
endfunction

function! LightlineBufferGitStatus() abort
  let gbstatus = get(b:, 'coc_git_status', '')
  return gbstatus
endfunction

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " 窗口宽度大于120时, 状态栏才显示 git blame 信息.
  return winwidth(0) > 120 ? blame : ''
endfunction
"""""""""""""""""""""""""""

" }}


" 主题定制 {{

" 代码高亮显示.
syntax enable

" 设置背景色为黑色或亮色, dark or light.
set background=dark

" 启用颜色主题方案, 优秀方案:
"   solarized: https://github.com/altercation/vim-colors-solarized
"   gruvbox: https://github.com/morhetz/gruvbox
"   molokai: https://github.com/tomasr/molokai
"   one: https://github.com/rakr/vim-one
"   dracula: https://draculatheme.com/vim
"
" NOTE:
"   1) 使用 VIM 主题, 同时请将终端主题也设置成对应的主题, 这样才能获得更好的视觉体验.
"      拿 iterm2 举例: Preferences->Profiles->Colors->Color Presets->Solarized Dark;
"      更多 iterm2 主题请参见: https://github.com/mbadolato/iTerm2-Color-Schemes
"   2) molokai 主题暂时没有 light 方案.
"
colorscheme gruvbox

" solarized 主题的自定义配置.
if (g:colors_name == 'solarized')
  " 定制状态栏的主题颜色.
  let g:lightline.colorscheme = 'solarized'
endif

" gruvbox 主题的自定义配置.
" doc: https://github.com/morhetz/gruvbox/wiki/Configuration
if (g:colors_name == 'gruvbox')
  let g:lightline.colorscheme = 'gruvbox'
  let g:gruvbox_underline = 0  " defaut: 1
  if (&background == 'dark')
    let g:gruvbox_contrast_dark = 'hard'  " default: medium
    let g:gruvbox_italicize_strings = 1  " default: 0
    let g:gruvbox_invert_signs = 1  " default: 0
    let g:gruvbox_improved_strings = 1  " default: 0
    let g:gruvbox_improved_warnings = 1  " default: 0
    hi Visual cterm=NONE ctermfg=NONE ctermbg=237 guibg=#3a3a3a
  else
    let g:gruvbox_contrast_light = 'hard'  " default: medium
    hi Visual cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
    hi CursorLine cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
    hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
  endif
endif

" molokai 主题的自定义配置.
if (g:colors_name == 'molokai')
  let g:lightline.colorscheme = 'molokai'
  if (&background == 'dark')
    hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE guibg=NONE guifg=NONE
    hi Cursorcolumn cterm=NONE ctermbg=234 ctermfg=NONE guibg=NONE guifg=NONE
    hi colorcolumn  cterm=NONE ctermbg=236 ctermfg=NONE guibg=NONE guifg=NONE
  endif
endif

" one 主题的自定义配置.
if (g:colors_name == 'one')
  let g:lightline.colorscheme = 'one'
endif

" 显示行号.
set nu

" 设置行号颜色.
" NOTE: VIM 识别三种不同的终端, term 黑白终端, cterm 彩色终端, gui Gvim 窗口.
hi LineNr cterm=NONE ctermbg=NONE ctermfg=238 guibg=NONE guifg=NONE

" 设置相对行号, 便于跨行的文本对象操作, 比如: [n]j/k/y/v/c/d 等.
set number relativenumber

" 显示当前光标所在的行号和列号.
set ruler

" 突出显示当前行.
set cursorline

" 突出显示当前列.
set cursorcolumn

" tab 键显示为 >---, 行尾空格显示为 -, 帮助我们及时发现规范问题.
set list listchars=tab:>-,trail:-

" 非可见字符 nbsp、tab、trail 是由 SpecialKey 高亮组来定义的,
" 所以这里使用 SpecialKey 来改变 tab 键和行尾空格的颜色样式.
hi SpecialKey cterm=NONE ctermbg=NONE ctermfg=238 guibg=NONE guifg=NONE

" 第 80 列通过颜色标注, 提示我们对单行代码长度的掌控.
autocmd FileType * set colorcolumn=80

" 设置提示列的颜色方案;
" 比如 ale 插件的代码静态检查的错误或警告信息就会出现在此列,
" coc-git 扩展的文件变化信息也会出现在此列.
hi SignColumn cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" 指定何时显示页面标签, 默认值: 1
"   0: 永远不会
"   1: 至少有两个标签页时才会
"   2: 永远会
set showtabline=1

" 命令行窗口的函数, 默认值7.
" 命令行窗口打开的方法:
"   1) command-line 模式下, 按快捷键 ctrl f 打开命令行窗口并显示命令历史记录.
"   2) normal 模式下, 按快捷键 q: 打开命令行窗口并显示命令历史记录.
"   3) normal 模式下, 按快捷键 q/ 将会打开命令行窗口并显示向下搜索的历史记录.
"   4) normal 模式下, 按快捷键 q? 将会打开命令行窗口并显示向上搜索的历史记录.
set cmdwinheight=8

" }}


" 目录树等图形接口 {{

"""""" preservim/nerdtree
" doc: https://github.com/preservim/nerdtree

" ,t  normal 模式下显示或隐藏目录树的快捷键.
nnoremap <Leader>x :NERDTreeToggle<CR>

" 目录树显示在左侧还是右侧.
" 可选值: 'right', 'left', 默认值: 'left'
let NERDTreeWinPos = 'left'

" 设置目录树窗口宽度, 默认值: 31
let NERDTreeWinSize=35

" 不显示目录树上方的 'Bookmarks' 和 'Press ? for help' 文本,
" 默认值为 0, 表示显示, 1 表示不显示.
let NERDTreeMinimalUI=1

" 按 m 键触发 menu 的时候, 是否使用精简版 menu, 类似这种:
"   Menu: [ (a)dd ,m,d,r,o,q,c,l] (Use j/k/enter or shortcut):
" 默认值: 0, 表示不使用.
let NERDTreeMinimalMenu=0

" 运行 VIM 时, 后面不接任何文件的情况, 自动打开目录树窗口.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" 运行 VIM 的时候自动打开目录树. 如果 vim 后面接了文件, 则将光标自动移动到文件窗口.
" NOTE: 如果使用 tmux, 不建议启用此条配置.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" 如果文件都退出了, 只剩目录树窗口的情况下自动退出 VIM.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" 每新打开一个标签页都显示当前已存在的目录树窗口.
" NOTE:
"   1)官方提供的指令是: autocmd BufWinEnter * silent NERDTreeMirror,
"     但经过实测, 会和以下2条指令产生冲突, 当 gd 或 gr 打开新的 buffer 时会报错:
"     冲突的2条指令是:
"         1) let g:ale_set_loclist = 1
"         2) map gr :YcmCompleter GoToReferences<CR>
"     修改为当前指令后, 可修复此问题.
"   2) 如果使用 tmux, 不建议启用此条配置.
"autocmd BufWinEnter *.* silent NERDTreeMirror

" 当项目下新增或删除文件时, 目录树窗口中自动更新变化,
" 省去了在目录树窗口中手动按 R 的动作了;
" 注意, 需要光标移动到目录树窗口中或重新打开目录树窗口来触发更新动作.
autocmd BufEnter NERD_tree_* | execute 'normal R'

" 目录树中目录折叠与展开的样式, 默认值: '▸' 和 '▾';
" 可供选择: '+' 与 '~', '<' 与 'v', 等等.
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" 标签页切换快捷键: `shift h` 向左, `shift l` 向右.
map <S-h> gT
map <S-l> gt

" 是否显示隐藏文件, 默认值: 0, 表示不显示.
let NERDTreeShowHidden=1

" 忽略哪些文件的显示, 开启这个将默认显示隐藏文件.
let NERDTreeIgnore=['\.git$','\.pyc$','__pycache__','\.swp$']

" 是否显示目录树的行号, 默认值: 0, 表示不显示.
let NERDTreeShowLineNumbers=0
"""""""""""""""""""

"""""" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \   "Modified"  : "✹",
    \   "Staged"    : "✚",
    \   "Untracked" : "✭",
    \   "Renamed"   : "➜",
    \   "Unmerged"  : "═",
    \   "Deleted"   : "✖",
    \   "Dirty"     : "✗",
    \   "Clean"     : "✔︎",
    \   'Ignored'   : '☒',
    \   "Unknown"   : "?"
    \ }
"""""""""""""""""""

"""""" majutsushi/tagbar
" 显示或隐藏大纲视图的快捷键: `,e`
nmap ,e :TagbarToggle<CR>

" Tagbar 窗口是否显示在左侧, 默认值: 0, 表示显示在右测.
let g:tagbar_left = 0

" 设置 Tagbar 窗口宽度, 默认值: 40
let g:tagbar_width = 35

" 是否开启自动预览, 如果开启, 将光标移动到 Tagbar 窗口时, 会自动打开一个新窗口用于预览,
" 随着光标在标签上移动, 预览窗口也会实时进行代码定位.
" 默认值: 0, 表示不开启预览.
let g:tagbar_autopreview = 1

" 根据 tag 的名称排序, 默认值: 1.
" 设置为 0 表示禁用排序, 即按标签本身在代码文件中的位置排序.
let g:tagbar_sort = 0
"""""""""""""""""""

"""""" 'ryanoasis/vim-devicons'
" doc: https://github.com/ryanoasis/vim-devicons

" 是否启用文件类型图标显示, 默认值: 1, 表示启用.
let g:webdevicons_enable = 1

" 为 gvim/mvim 设置字体和字号.
" NOTE: 如果使用 iterm2 终端, 需要通过更改 iterm2 的 font 字体才可以,
"       此处的配置对 iterm2 无效, 更改 iterm2 的 font 字体:
"       Preferences -> Text -> Font, 选择 Hack Nerd Font 或 Hack Nerd Font Mono.
set guifont=Hack_Nerd_Font:h13
"""""""""""""""""""""""""""""""

"""""" 'airblade/vim-gitgutter'
" doc: https://github.com/airblade/vim-gitgutter

" 设置提示标识的高亮颜色.
hi GitGutterAdd    guifg=#009900 ctermfg=2
hi GitGutterChange guifg=#bbbb00 ctermfg=3
hi GitGutterDelete guifg=#ff2222 ctermfg=1
"""""""""""""""""""""""""""""""

"""""" 'Yggdroot/indentLine'

" 此插件会自动设置 set conceallevel=2, 导致 markdown 隐藏部分语法的显示, 比如 ** **,
" 通过在这里排除掉 markdown 来解决这个问题.
" NOTE: 如果 json 类型文件中无法显示双引号可能也是由此插件导致,
" 把 json 和 jsonc 添加到下面列表中即可.
let g:indentLine_fileTypeExclude = ['markdown']

"""""""""""""""""""""""""""""""

"""""" 'voldikss/vim-floaterm'
" doc: https://github.com/voldikss/vim-floaterm

" 显示或隐藏悬浮终端窗口, 如果悬浮窗口还不存在则新建.
let g:floaterm_keymap_toggle = '<Leader>t'

" 新建一个悬浮窗口.
let g:floaterm_keymap_new = '<Leader>tc'

" 关闭当前悬浮窗口.
let g:floaterm_keymap_kill = '<Leader>tk'

" 切换到下一个悬浮窗口.
let g:floaterm_keymap_next = '<Leader>tn'

" 显示目前存在的悬浮窗口.
let g:floaterm_keymap_show = '<Leader>ts'
""""""""""""""""""""""""""""""

" }}


" 效率相关 {{

"""""" takac/vim-hardtime
" doc: https://github.com/takac/vim-hardtime

" 是否使每一个窗口 buffer 都应用此插件功能, 默认值: 0.
let g:hardtime_default_on = 1

" 连续按 jklh 等命令时, 每次按键的超时时间, 默认值: 1000毫秒.
let g:hardtime_timeout = 1000

" 启用 hardtime 模式后, 是否进行模式已启用的提示, 默认值: 0, 表示不提示.
let g:hardtime_showmsg = 1

" 是否允许连续按2个不同的简单指令, 比如 jh, 默认值: 0, 表示不允许.
let g:hardtime_allow_different_key = 1

" 允许连续按几次简单命令, 默认值: 1.
let g:hardtime_maxcount = 2

"""""" easymotion/vim-easymotion
" doc: https://github.com/easymotion/vim-easymotion

" 标记所有窗口的单词.
nmap <Leader>w <Plug>(easymotion-overwin-w)
" 仅标记当前窗口的单词.
"map  <Leader>w <Plug>(easymotion-bd-w)

" 标记所有窗口的所有行首字符.
nmap <Leader>L <Plug>(easymotion-overwin-line)
" 标记当前窗口的所有行首字符.
"map <Leader>L <Plug>(easymotion-bd-jk)

" 标记当前行光标右侧的字符.
map <Leader>l <Plug>(easymotion-lineforward)
" 标记当前行光标左侧的字符.
map <Leader>h <Plug>(easymotion-linebackward)

" 输入1个目标字符即可高亮定位, 支持多窗口同时定位.
nmap s <Plug>(easymotion-overwin-f)
" 需要输入2个目标字符才可高亮定位, 支持多窗口同时定位.
"nmap s <Plug>(easymotion-overwin-f2)

" 覆盖 VIM 自带的 / 搜索模式.
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" 是否启用默认的快捷键映射, 默认值: 1, 表示启用.
let g:EasyMotion_do_mapping = 1

" 搜索字母的时候是否忽略大小写和 VIM 的 smartcase 表现一致.
let g:EasyMotion_smartcase = 1

" 搜索小写字母, 搜索结果大小写字母都包含, 但搜索大写字母时, 搜索结果仅包含大写字母.
let g:EasyMotion_use_smartsign_us = 1
"""""""""""""""""""""

"""""" Yggdroot/LeaderF
" 需要在系统上提前安装 rg 命令: brew install rg
" doc: https://github.com/Yggdroot/LeaderF

" 项目根目录的标志.
let g:Lf_RootMarkers = ['.git']

" 设置 LeaderF 工作目录为项目根目录, 如果不在项目中, 则为当前目录.
let g:Lf_WorkingDirectoryMode = 'A'

" 预览代码, 默认值: 0
let g:Lf_PreviewCode = 1

" 弹出独立的窗口来显示搜索文件.
let g:Lf_WindowPosition = 'popup'

" 弹出的窗口占终端屏幕的百分比, 0.8 即 80%.
let g:Lf_PopupWidth = 0.8

" 是否在弹出的窗口中预览搜索结果, 默认值: 0
let g:Lf_PreviewInPopup = 1

" 弹出的窗口的颜色模式, 默认值: 'default'.
let g:Lf_PopupColorscheme = 'default'

" 弹出的窗口的高度, 默认值: 0.4, 表示占屏幕的 40%.
let g:Lf_PopupHeight = 0.6

" normal 模式下 ,f  进入文件搜索的模糊搜索方式; 再 ctrl r  进入 正则匹配 方式.
let g:Lf_ShortcutF = ",ff"

" 搜索当前已经打开的所有文件的内容.
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>

" 显示最近打开过的文件列表.
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>

" 显示当前文件的 tag 信息.
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>

" 显示当前文件去除空行之外的所有行.
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" 从 normal 模式下按 ,rg 进入 command-line 模式下,
" 然后输入要搜索的文本(支持正则表达式), 回车即可显示此项目内包含此文本的文件列表;
" 在弹出的结果窗口中, 按 gi 可以将光标移动到输入框, 可以继续输入内容缩小结果列表,
" 然后按 tab 进入结果列表中, 按 j/k 上下选择, 选择一个文件后,
" 按 t 将以新建标签页的方式打开选择的文件.
noremap <Leader>rg :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>

" visual 模式下选择文本后, 按 rg 在整个项目内搜索选择的文本, 显示搜索结果.
xnoremap rg :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>

" ,rg 搜索内容关闭后, 想再次搜索上次搜索的内容, normal 模式下按 rc 即可.
noremap <Leader>rc :<C-U>Leaderf! rg --recall<CR>
"""""""""""""""""""""

"""""" lyokha/vim-xkbswitch
" doc: https://github.com/lyokha/vim-xkbswitch
" 功能:
"   从 insert 模式切换到 normal 模式时, 如果 insert 模式下为中文输入法,
"   则自动切换为英文输入法, 然后从 normal 模式重新进入 insert 模式时,
"   还原上一次 insert 模式下的输入法.
" 系统依赖安装(macOS):
"   git clone https://github.com/myshov/xkbswitch-macosx.git
"   cp xkbswitch-macosx/bin/xkbswitch /usr/local/bin/
"   git clone https://github.com/myshov/libxkbswitch-macosx
"   cp libxkbswitch-macosx/bin/libxkbswitch.dylib /usr/local/lib/

" 是否开启输入法切换功能.
" NOTE: 在 tmux 下无法正常使用, 为避免影响切换效率, 建议禁用, 0 为禁用.
let g:XkbSwitchEnabled = 0

let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.dylib'

" 默认情况从 insert 模式到 normal 模式, 将还原 normal 的上一次输入法,
" 如果 normal 上一次是中文, 这次还是中文;
" 添加此指令后, 将始终保持 normal 模式是英文输入法.
let g:XkbSwitchNLayout = 'us'

" 同上一条, 区别是这条指令针对的是 insert 模式,
" 目前的输入体验是不建议启用这条指令, 可根据自身的使用场景调整.
"let g:XkbSwitchILayout = 'us'

" 默认情况下, 从 insert 模式切换到 normal 模式,
" 输入法从中文切换到英文有一定的延迟, 非常影响体验,
" 此条指令解决这个问题, 可以将数字改的更小以或得更快的切换体验.
set ttimeoutlen=25
"""""""""""""""""""""

"""""" machakann/vim-highlightedyank
" doc: https://github.com/machakann/vim-highlightedyank

" 被复制的文本对象的高亮颜色显示的时间, 单位毫秒.
" 如果值为 -1, 则表示高亮颜色永久显示.
let g:highlightedyank_highlight_duration = 1000

" 解决个别主题或 terminal 配置下高亮不生效的问题, 一般可不配置此项.
highlight HighlightedyankRegion cterm=reverse gui=reverse
"""""""""""""""""""""

"""""" unblevable/quick-scope
" doc: https://github.com/unblevable/quick-scope

" 是否禁用此插件, 默认值1, 表示启用.
let g:qs_enable=1

" 性能考虑, 是否延迟显示高亮字符, 默认值: 0, 表示实时显示.
let g:qs_lazy_highlight = 0
"""""""""""""""""""""

" }}


" 编程语言 {{

"""""""" Go {{

"""""" fatih/vim-go
" doc: https://github.com/fatih/vim-go

" *** 代码自动格式化 ***
" 默认值: 1
let g:go_fmt_autosave = 1
" 默认值: 1
let g:go_imports_autosave = 1


" *** 代码高效阅读 ***

" 使用 K 触发 :GoDoc 文档, 覆盖默认的 man, 默认值: 1, 表示启用.
" 此处禁用, 这里使用 coc.nvim 的 K 映射.
let g:go_doc_keywordprg_enabled = 0

" ,d  上下分屏查看文档, 如果设置了 let g:go_doc_popup_window = 1, 则弹出浮窗.
"au FileType go nmap <Leader>d <Plug>(go-doc)

" ,dv  左右分屏查看光标所在函数等的文档,
"      如果设置了let g:go_doc_popup_window = 1, 则弹出浮窗.
"au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)

" 查看光标下对象的文档的窗口大小. 默认值: 20
"let g:go_doc_max_height = 20
" 查看光标下的对象的文档的时候使用悬浮窗口替代新打开一个窗口. 默认值: 0
"let g:go_doc_popup_window = 1

" gr  在 location list 中列出哪些地方引用了光标所在的对象.
" NOTE: coc-go 的 gr 表现的更好, 不使用此配置.
"au FileType go nmap gr :GoReferrers<CR>

" ,cl  在 location list 中列出哪些地方调用了光标所在的函数.
au FileType go nmap <leader>cl :GoCallers<CR>
" ,s  查看光标所在的类型实现了哪些接口, 注意光标只能在类型或类型的方法上.
au FileType go nmap <Leader>s <Plug>(go-implements)

" NOTE:
"   Go 跳转到光标所在函数定义处的4种方式均由 vim-go 插件提供, 和 YCM 配置无关.
"   如果光标所在函数定义处就是在当前页面, 则直接在当前页内跳转, 并不打开新页面;
"   如果在当前页面内跳转, 推荐使用 ctrl o/i 来回跳转切换, 以提高效率.
"
" gd  默认以覆盖当前页面的方式跳转到函数定义处, vim-go插件默认行为, 无需配置.
"
" gl  新开一个标签页的方式跳转到函数定义处.
au FileType go nmap gl <Plug>(go-def-tab).
" gs  上下分屏跳转到函数定义处.
au FileType go nmap gs <Plug>(go-def-split)
" gv  左右分屏跳转到函数定义处.
au FileType go nmap gv <Plug>(go-def-vertical)
" 对于跳转到对象定义处的功能, 重用已经打开的buffer. 默认值: 0
let g:go_def_reuse_buffer = 0


" *** 代码自动生成 ***
" ,im  自动为光标下的类型生成指定接口的实现方法.
au FileType go nmap <leader>im :GoImpl<CR>
" ,ki  自动把光标所在的结构体字面量(仅有value没有key的情况)补充上字段.
au FileType go nmap <leader>ki :GoKeyify<CR>
" ,fs  自动把光标所在的结构体字面量, 以字段零值方式补上尚未填写的字段.
au FileType go nmap <leader>fs :GoFillStruct<CR>
" ,ie  自动生成 if err != nil 代码段.
au FileType go nmap <leader>ie :GoIfErr<CR>
" ,at  为光标所在的结构体定义自动生成字段对应的tags.
au FileType go nmap <leader>at :GoAddTags<CR>
" 使用 :GoAddTags 时, 是否忽略未导出的结构体字段(即小写字段), 1 表示忽略. 默认值: 0
let g:go_addtags_skip_unexported = 1
" ,rn  级联的重命名光标下的标识符, 重命名后, 项目内的所有与其相关的地方全部会更新;
"      由于 coc.nvim 的 ,rn 表现的更好, 注释此配置.
"au FileType go nmap <leader>rn :GoRename<CR>
" 新创建一个 .go 文件时, 是否自动使用模版内容填充, 默认值: 1
let g:go_template_autocreate = 1
" 始终仅自动生成 package pkgname 一行代码,
" 将覆盖掉 let g:go_template_autocreate = 1 的作用, 默认值: 0
let g:go_template_use_pkg = 1


" *** 运行当前 Go 文件 ***
" ,gr  go run 当前的go文件.
au FileType go nmap ,gr <Plug>(go-run)
" ,gb  go build 当前的go文件, 不产生二进制文件, 只是检查是否可以成功build.
au FileType go nmap ,gb <Plug>(go-build)
" ,gt  go test 当前的go文件.
au FileType go nmap ,gt <Plug>(go-test)
" ,gc  查看当前代码文件的测试覆盖率.
au FileType go nmap ,gc <Plug>(go-coverage)


" *** 代码语法高亮 ***
" 以下指令默认值都是0.
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
" 以下指令默认值都是1.
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
""""""""""

" }}

"""""""" Python {{

" requirements 文本文件内容也高亮显示.
autocmd BufNewFile,BufRead requirements*.txt set ft=python

" 新建 .py 结尾的文件时, 自动输入一些内容
func SetTitleForPython()
    call setline(1, "\#!/usr/bin/env python3")
    call setline(2, "\"\"\"")
    call setline(3, "Author: windvalley")  " 改成你自己的名字
    call setline(4, "Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
    call setline(5, "\"\"\"")
    normal G
    normal o
    normal o
    " 为新创建的 .py 文件自动赋予可执行权限
    au BufWritePost *.py silent !chmod a+x <afile>
endfunc
autocmd bufnewfile *.py call SetTitleForPython()

" 如果一个 .py 文件开头第一行不是以 #! 开头, 就去除掉文件的可执行权限.
function! NoShabang(line1, current_file)
  if a:line1 !~ '^#!'
    let chmod_command = "silent !chmod ugo-x " . a:current_file
    execute chmod_command
  endif
endfunction
autocmd BufWritePost *.py call NoShabang(getline(1), expand("%:p"))

" }}

"""""""" OpenResty/Lua {{
func SetTitleForLua()
    " 自动获取文件名称, 不包含文件扩展名.
    let filename = expand('%:r')
    let lua_module_name = join(["_M.name = \"", filename, "\""], "")

    call setline(1, "local ngx = require \"ngx\"")
    call setline(2, "")
    call setline(3, "")
    call setline(4, "local _M = {}")
    call setline(5, "")
    call setline(6, "_M._VERSION = 0.1")
    call setline(7, lua_module_name)
    call setline(8, "")
    normal G
    normal o
    normal o
endfunc
autocmd bufnewfile *.lua call SetTitleForLua()

" }}

"""""""" Javascript/vue/html/css {{

" 将 .json 文件设置为 jsonc 文件类型, 这样就可以在其中进行 // 或 /**/ 注释了.
autocmd BufRead,BufNewFile *.json set filetype=jsonc

" css
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"""""" posva/vim-vue 插件
" 解决 vim-vue 插件导致的 VIM 速度变慢的问题.
let g:vue_pre_processors = []

"""""" 'mattn/emmet-vim'
" doc: https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
" 使用方法:
" 1. 打开 *.html 文件, 输入`html:5`, 然后`ctrl y ,`, 即可自动生成html代码模版
" 2. 输入`div`, 然后`ctrl y ,`, 即可自动生成: <div></div>
" 3. 输入`#foo`, 然后`ctrl y ,`, 可自动生成: <div id="foo"></div>
" 4. 输入`div>p>a`, 然后`ctrl y ,`, 可自动生成: <div><p><a href=""></a></p></div>

" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" 默认值: <C-y>
let g:user_emmet_leader_key='<C-y>'

" }}

"""""""" Shell {{

func SetTitleForShell()
    let current_filename = expand('%:t')
    call setline(1, "\#!/usr/bin/env bash")
    call setline(2, "# " . current_filename)
    call setline(3, "#")
    " 改成你自己的名字
    "call setline(4, "# Author: windvalley")
    "call setline(5, "# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
    call setline(4, "")
    normal G
    normal o
    normal o
    " 为新创建的 .sh 文件自动赋予可执行权限
    au BufWritePost *.sh silent !chmod a+x <afile>
endfunc
autocmd bufnewfile *.sh call SetTitleForShell()

" }}

"""""""" Markdown {{

""""""" dhruvasagar/vim-table-mode
" doc: https://github.com/dhruvasagar/vim-table-mode

" normal 模式下, 默认以 ,tm 来开启或关闭 table mode.
noremap <leader>tm :TableModeToggle<CR>

" 在 insert 模式下, 输入 || 后按 ESC 来开启 table mode,
" 输入 __ 后按 ESC 关闭 table mode.
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

""""""" iamcco/markdown-preview.nvim
" doc: https://github.com/iamcco/markdown-preview.nvim

" 打开或关闭预览.
"nmap <leader>p <Plug>MarkdownPreviewToggle

"let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"

"let g:mkdp_auto_close=0

"let g:mkdp_refresh_slow=1

""""""" instant-markdown/vim-instant-markdown
" doc: https://github.com/instant-markdown/vim-instant-markdown

" ,p  打开浏览器预览.
nmap <leader>p :InstantMarkdownPreview<CR>

" ,,p  关闭预览.
nmap <leader>,p :InstantMarkdownStop<CR>

" 是否打开 markdown 类型文件时自动打开预览, 默认值: 1
let g:instant_markdown_autostart = 0

" 指定日志文件.
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'

" }}

" }}


" 常用原生选项 {{

" 一行内容超过终端宽度时是否折行, 默认就是折行.
set wrap

" 显示括号匹配.
set showmatch

" normal 模式下显示输入的 VIM 命令.
set showcmd

" 一个 tab 显示几个空格长度, 默认是8个空格, 这里改为4个空格.
set ts=4

" 将 tab 缩进用空格来表示, 提高效率.
set expandtab

" insert 模式下按退格键的时候退回缩进的长度为4个空格, 默认是退回一个空格.
set softtabstop=4

" 启用智能缩进, 按回车键后自动缩进,
" 注意启用此模式后, 粘贴代码时要先 :set paste
set smartindent

" 进行搜索时会快速找到结果, 随着输入的字符进行及时匹配.
set incsearch

" 搜索关键字高亮显示.
set hlsearch

" 搜索时忽略大小写.
set ignorecase

" 如果同时打开了ignorecase, 那么对于搜索只有一个大写字母的搜索词, 将大小写敏感;
" 其他情况都是大小写不敏感, 比如: 搜索 Test 时, 将不匹配 test,
" 但搜索 test 时, 将匹配 Test.
set smartcase

" 不创建备份文件. 默认情况下, 文件保存时, 会额外创建一个备份文件,
" 它的文件名是在原文件名的末尾, 再添加一个波浪号(〜).
set nobackup

" 出错时不要发出响声.
set noerrorbells

" command-line 模式下, 操作指令按下 tab 键自动补全:
" 第1次按下 tab, 会显示所有匹配的操作指令的清单, 第2次按下 tab, 会依次选择各个指令.
set wildmenu
set wildmode=longest:list,full

" 打字的时候隐藏鼠标光标.
set mousehide

" 打开文件监视, 在修改内容后保存文件, 如果文件已经被其他 VIM 实例打开, 则会进行提示,
" 如果忽略提示强制进行保存, 则其他 VIM 实例打开的此文件也会同步变更.
set autoread

" normal 模式下允许光标移动到最后一个字符的右边.
set virtualedit=onemore

" 当一行字符长度超过多少个字符时, 会自动换行, 注意会加上换行符;
" 我这里配置这个的目的是解决 .vimrc 的注释内容超过80个字符就自动换行的问题.
set textwidth=1000

" }}


" 自定义配置 {{

" ,E  上下分屏方式打开 ~/.vimrc 配置文件.
noremap <leader>E :sp ~/.vimrc<CR>

" ,R  变更 ~/.vimrc 文件后不需要退出, 直接使用此命令进行 reload 生效.
noremap <silent> <leader>R :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" 多窗口之间上下左右移动的快捷键重新映射.
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" 解决中文乱码问题.
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" visual 模式下选择内容, 然后通过按 ,) 或 ,] 或 ,} 或 ," 或 ,' 或 ,`
" 将选择的内容使用 () 或 [] 或 {} 或 "" 或 '' 或 `` 包裹.
vnoremap <leader>) <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>] <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>} <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>` <esc>`>a`<esc>`<i`<esc>

" insert 模式下移动光标的快捷键:
"   `ctrl f` 右, `ctrl b` 左, `ctrl p` 上, `ctrl n` 下,
"   `ctrl a` 行首, `ctrl e` 行尾.
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
imap <C-a> <Home>
imap <C-e> <End>

" normal 模式下, 使用Y复制当前行光标之后的内容, 和C和D用法统一起来.
nnoremap Y y$

" normal 模式下 shift >> 和 shift << 或
" visual 模式下 shift > 和 shift < 每次缩进4个空格, 默认是8个空格.
set shiftwidth=4

" visual 模式下进行 shift > 和 shift < 缩进操作时,
" 使不退出 visual 模式, 这样可方便执行多行的连续缩进.
vnoremap < <gv
vnoremap > >gv

" 重新打开文件时, 光标恢复在上次离开时的位置.
augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" insert 模式下使用 <BS> <Del> <C-W> <C-U>, 解决无法回退删除等问题,
" 比如按 backspace 键无反应.
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" :W  普通用户没有权限时使用 sudo 权限保存文件.
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" 保留撤销历史, VIM 会在编辑时保存操作历史, 用来供用户撤消更改;
" 默认情况下, 操作记录只在本次编辑时有效, 一旦编辑结束、文件关闭, 操作历史就消失了;
" 打开这个设置, 可以在文件关闭后, 操作记录保留在一个文件里面继续存在.
" 这意味着, 重新打开一个文件, 可以撤销上一次编辑时的操作;
" 撤消文件是跟原文件保存在一起的隐藏文件, 文件名以 .un~ 开头. 
set undofile
set undodir=~/.vim/undo
if !isdirectory(&undodir)
  call mkdir(&undodir, 'p', 0700)
endif

" normal 模式下的 nyy 复制(n为数字), 或进入 visual 模式下选择内容后的 y 复制,
" 除了可以将复制的内容粘贴(使用 p)到其他 VIM 实例,
" 还可以将内容粘贴(command v)到系统的其他任何可输入窗口.
"
" 注意: 以上所说的都是针对本地操作系统使用本地 VIM 的情况,
" 比如 macOS/Windows/Linux 本地的 VIM 和本地的其他应用窗口之间,
" 不包括远程连接的操作系统的 VIM 和本地应用的窗口之间.
if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamed,unnamedplus " for Linux
    else
        set clipboard=unnamed " for macOS、Windows
    endif
endif

" 此配置确保在非图形界面的终端, 且终端类型不是 xterm 的情况下,
" 只能在 c v i 三种模式下使用鼠标, 也就是在 normal 模式(n)下禁用鼠标,
" 这样当用户在 normal 模式下时, VIM 将不对鼠标进行响应,
" 这样就可以使用鼠标复制 VIM 窗口里的内容到其他应用程序里去了.
"
" 注意: 这里的配置适合使用 macOS 自带的 terminal 的场景,
" 如果使用的是 iterm2, 则不需要这段配置也能正常使用.
if has('mouse')
  if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
    set mouse=a  " a 表示全部 VIM 模式下都可以使用鼠标.
  else
    set mouse=vic  " 只在命令模式(c)、visual 模式(v)、insert 模式(i)中使用鼠标.
  endif
endif

" }}


" 备用配置 {{

" 将 sign 列合并到行号列, 会影响到 [n]k/j 快速跳转到指定行, 所以不建议开启此配置.
"set signcolumn=number

" sign 列始终显示, 根据个人喜好决定是否启用.
"set signcolumn=yes

" 输入的文字到达终端边缘时不自动折行, 所谓折行指的是一行内容视觉上显示为多行,
" 不是真正的加换行符的换行.
"set nowrap

" 保存文件时自动去除行尾空格, 注意已经通过ale配置, 此条注释不再使用.
"autocmd BufWritePre *.sh,*.lua,*.js,*.html,*.vue,*.toml,*.yaml,*.yml :%s/\s\+$//e

" 退出 insert 模式时指定类型的文件将自动保存.
"au InsertLeave *.go,*.lua,*.sh,*.py,*.js,*.md write

" 退出文件后, 屏幕依然显示该文件内容.
"set t_ti= t_te=

" 打开英语单词的拼写检查.
"set spell spelllang=en_us

" 覆盖掉默认的拼写检查设置, 不启用拼写检查.
"autocmd VimEnter * set nospell

" 不创建交换文件, 交换文件主要用于系统崩溃时恢复文件, 文件名以 . 开头, 文件后缀是 .swp
"set noswapfile

" 出错时, 发出视觉提示, 通常是屏幕闪烁.
"set visualbell

" }}


" VIM 使用技巧 {{

"""""""""" 常用命令行 {{
"
" vim -u NONE                   无插件方式运行 VIM.
" vim -g 或 mvim 或 gvim        macOS 下运行 VIM 的图形界面模式, 需安装 macvim.
" vim -V9myVIM.log              将 VIM 运行的详细日志保存到 myVIM.log 文件中.
" vim --startuptime vim.log     记录带时间字段的启动日志.
" vim -c 'normal 5G36|'         normal 模式下跳转到第 5 行第 36 列.
" vimtutor                      VIM 自带的学习教程.
"
" }}

"""""""""" 常用的原生能力 {{
"
" ** 持续优化你的 vimrc 文件:
"           :version  显示当前 VIM 的版本号和支持的特性.
"     :help [object]  object 表示你要查看其文档的 VIM 某个命令或者插件名称等.
"        :h [object]  同上.
"           :h index  查询 VIM 所有键盘命令定义.
"          :h ctrl-p  查看 normal 模式下 ctrl p 快捷键的意思.
"        :h i_ctrl-p  查看 insert 模式下 ctrl p 快捷键的意思.
"                  K  1)通过上个命令打开文档, 对于有下划线的文本对象,
"                       按 K 即可直接跳转到相关的文档,
"                       ctrl o/i 可来回跳转, 增加文档阅读效率;
"                     2)在阅读 .vimrc 时, 可通过按 K 自动打开光标所在对象的文档.
"              :so %  优化变更你的 ~/.vimrc 文件内容并保存后,
"                     使用此 command-line 模式命令, 可以直接使配置生效.
"                 ,R  同上, 只不过这个是为了操作简便做的自定义配置.
"          :messages  如果出现报错信息, 但是你还没看清楚就消息就已经退出了,
"                     使用此命令可以重新看到错误信息.
"           :h error  查看 VIM 都有哪些错误信息.
"             :h E11  查看具体的某一个错误编号的释义.
"
" ** 文本对象的快捷编辑:
"
"   涉及到的常用字符说明:
"                  y  表示复制.
"                  v  表示选择, 选择后进入 visual 模式.
"                  d  表示删除.
"                  x  表示删除, 但删除对象只能是字符单位.
"                  c  表示修改, 意思是删除文本对象后进入 insert 模式等待输入新内容.
"                  s  表示修改, 但修改对象只能是字符单位,
"                     但本 vimrc 已经配置将 s 给 easymotion 插件使用.
"                  J  表示join, 合并多行到当前行.
"
"                  l  表示光标右侧1个字符.
"                  h  表示光标左侧1个字符.
"                  e  表示光标右侧1个单词, end 指的是单词结尾,
"                     也就是不包含右侧紧邻的空白字符, 相当于 iw.
"                  w  表示光标右侧1个单词,
"                     如右侧挨着空白字符, 则包含右侧挨着的所有空白字符,
"                     如果是 aw, 则仅包含右侧挨着的1个空白字符.
"                  b  表示光标左侧1个单词.
"                  W  表示光标右侧1个单词, 这里的单词是指非空白字符都是单词的组成部分,
"                     也就是以空白字符作为单词分隔符, 同样如果右侧挨着空白字符,
"                     也包含空白字符.
"                  B  表示光标左侧1个单词(非空白字符也是单词的组成部分).
"                  s  sentence, 句子.
"                  p  paragraph, 段落.
"                  t  tag, html 标签.
"
"                  n  表示要操作的文本对象的数量, 不写 n 的话, 默认是 1.
"                  i  inside, 表示光标在要操作的文本对象的内部, 不包含边界.
"                  a  around, 表示光标在要操作的文本对象的内部, 包含边界.
"                  t  till, 向右到某个字符, 不包含目标字符.
"                  T  向左到某个字符, 不包含目标字符.
"                  f  forward, 向右到某个字符, 包含目标字符.
"                  F  向左到某个字符, 包含目标字符.
"
" 以上字符可按基本规则自由组合:
"       y/v/d/c [n]l  复制/选择/删除/修改光标右 n 个字符, n 可不输入, 默认是1.
"       y/v/d/c [n]h  复制/选择/删除/修改光标左 n 个字符.
"       y/v/d/c [n]e  复制/选择/删除/修改光标右 n 个单词, 不包含右侧空白字符.
"       y/v/d/c [n]w  复制/选择/删除/修改光标右 n 个单词, 包含右侧空白字符.
"       y/v/d/c [n]W  复制/选择/删除/修改光标右 n 个单词, 特殊字符也作为单词的一部分,
"                     包含右侧空白字符.
"       y/v/d/c [n]b  复制/选择/删除/修改光标左 n 个单词.
"       y/v/d/c [n]B  复制/选择/删除/修改光标左 n 个单词, 特殊字符也作为单词的一部分.
"         y/v/d/c f*  复制/选择/删除/修改光标右侧直到*的文本,
"                     包含*, *表示一个具体的字符.
"         y/v/d/c t*  复制/选择/删除/修改光标右侧直到*的文本, 不包含*,
"                     *表示一个具体的字符.
"        [n]yy/dd/cc  复制/删除/修改 n 行.
"         y/v/d/c ip  复制/选择/删除/修改 光标所在段落.
"         y/v/d/c it  复制/选择/删除/修改 光标所在的 html 标签.
"          y/v/d/c 0  从光标位置 复制/选择/删除/修改 到行首.
"          y/v/d/c $  从光标位置 复制/选择/删除/修改 到行尾.
"         di "/(/{/[  删除 "" 或 () 或 {} 等之间的所有字符, 不包括它们本身.
"         da "/(/{/[  删除 "" 或 () 或 {} 等之间的所有字符, 也包括它们本身.
"               c2i(  删除2层 () 内的内容, 只留下一对 (),  并进入 insert 模式.
"                     还有很多不同组合, 请亲自尝试理解:
"                         yw/ye/yiw/y3w/yW/yi{/ya{/y3i{/yb/yB
"                         vw/ve/viw/vaw/v3iw/vW/vi{/va{/v3i{
"                         cw/ciw/c3w/cW/cb/cB
"                         dw/diw/db/dB/d3w
"                         ...
"                dgg  从光标位置删除到文件头部.
"                 dG  从光标位置删除到文件尾部.
"                dip  光标在空白行时, 使用此快捷键删除所有临近的空白行.
"                  D  删除当前行光标之后的内容.
"                  C  修改当前行光标之后的内容.
"               [n]x  剪切光标右侧 n 个字符, 同 d[n]l.
"               [n]X  剪切光标左侧 n 个字符, 同 d[n]h.
"               [n]s  修改光标后 n 个字符, 同 c[n]l.
"                     NOTE: 本 vimrc 文件配置已将 s 命令给 easymotion 插件使用.
"               [n]S  修改整行, 同 [n]cc.
"               [n]J  合并包含光标所在行在内的 n 行到当前行,
"                     如果只是 J, 则是合并下一行到光标所在行.
"                p/P  在光标 右侧/左侧 粘贴.
"               [n]r  替换当前光标右侧 n 个字符.
"                  R  进入 replace 模式, 每次按键替换一个字符,
"                     直到按 ESC 键退出 replace 模式.
"                  u  undo, 撤销最近一次的修改动作.
"                  U  撤销当前所在行的所有修改.
"             ctrl r  redo, 恢复最近一次的撤销内容.
"    :n,ms/old/new/g  将文件内第 n 行到第 m 行的所有 old 替换为 new;
"                     如果是先在 visual 模式下选择了一段内容,
"                     再按 : 则 command-line 模式栏会变为 :'<,'>,
"                     最后我们补全为 :'<,'>s/old/new/g, 即可完成替换选择的文本部分.
"      :%s/old/new/g  将文件内所有 old 替换为 new, g 表示全局替换, 如果没有 g,
"                     则每行只替换第一个匹配项.
"     :%s/old/new/gc  每个匹配串替换前先提示是否进行替换.
"             ctrl o  insert 模式下, 使临时进入 normal 模式下,
"                     执行一个 normal 命令就自动再返回 insert 模式下.
"         ctrl h/w/u  insert 模式下, 向左删除 1个字符/1个单词/到行首.
"      ctrl od l/w/e  insert 模式下, 向右删除 1个字符/1个单词/1个不含空格的单词.
"            ctrl oD  insert 模式下, 向右删除到行尾.
"
" ** 大小写转换:
"               gUiw  将单词转成大写.
"               guiw  将单词转成小写.
"                guu  将全行转成小写.
"                gUU  将全行转成大写.
"
" ** 移动光标:
"               kjhl  上下左右移动光标.
"              gk/gj  对于折行的情况, 向上/向下在折行间移动光标.
"                w/W  向右移动一个单词位置, 光标在单词开头,
"                     大写表示特殊符号也算单词的组成部分, 可前置数字表示移动的单词数量.
"                e/E  同上, 区别是移动到单词末尾.
"                b/B  向左移动一个单词位置, 光标在单词开头, 其他同 w/W.
"                  0  光标跳转到行首.
"                  ^  光标跳转到行首第一个非空字符.
"                  $  光标跳转到行尾.
"                (/)  移动到上一句/下一句.
"                {/}  移动到上一段落/下一段落.
"                  M  光标移动到当前屏幕的中间行的行首.
"             Ngg/NG  光标移动到第 N 行.
"                 N%  光标移动到 N% 行处.
"                 N|  至第 N 列, 这里的 | 是竖线字符.
"                */#  匹配当前光标所在单词并跳转到下一个单词/上一个单词.
"                 f*  这里的 * 表示任意你要跳转到的本行字符, 比如你要跳转到 m, 则`fm`,
"                     然后按`;`继续向右匹配, 按`,`向左匹配, 直到跳转到自己想去的位置.
"                 t*  同上, 区别是不包含目标字符.
"              F*/T*  同上, 区别是方向是向左的.
"           ctrl o/i  将光标跳转到之前/之后的位置.
"           ctrl f/b  向下/向上翻整屏.
"           ctrl d/u  向下/向上翻半屏.
"           ctrl e/y  以一行为单位上下移动屏幕, 而不移动光标.
"           zt/zz/zb  把光标所在行放置到屏幕的顶部、中间、底部.
"                  %  跳转到光标所在的 {([ 匹配匹配的另一端.
"                 gf  跳转到光标所在文本对象所对应的文件.
"                 gd  跳转到光标所在文本对象的定义处.
"                 `.  回到上次编辑的位置.
"
" ** 排版:
"              >>/<<  normal 模式下向 右/左 缩进4个空格.
"                >/<  visual 模式下向 右/左 缩进4个空格.
"                 ==  自动缩进.
"                :ce  本行文字居中(center).
"                :le  本行文字靠左(left).
"                :ri  本行文字靠右(right).
"
" ** 进入 insert 模式的几种方法:
"                  i  在当前光标位置插入.
"                  I  在当前行第一个非空字符前插入.
"                 gI  在行首插入.  回到上次编辑的位置.
"                  a  光标向右移动一个位置.
"                  A  光标跳转到行尾插入.
"                  o  向下新建一行插入.
"                  O  向上新建一行插入.
"
" ** visual 模式:
"                  v  进入 visual 模式.
"                  V  进入 visual line 模式.
"             ctrl v  进入 visual block 模式.
"                  o  使光标在选择范围的开头和结尾来回跳转.
"                  O  visual block 模式下除了 o 光标跳转, O 是另一种跳转方式.
"                  u  选择的区域全部转换成小写.
"                  U  选择的区域全部转换成大写.
"                  ~  选择的区域的大小写反转.
"           g ctrl g  显示选择区域的统计信息.
"
" ** 分屏/多窗口管理:
"            :sp/:vs  上下/左右 分割窗口.
"       :sp/:vs file  上下/左右 分屏创建新文件.
"            ctrl ww  光标在多个分屏窗口之间循环移动.
"     ctrl w j/k/h/l  光标移动到 下面/上面/左边/右边 的窗口.
"            ctrl wp  光标移动到上一次所在的窗口.
"              :only  多个分屏窗口的场景下, 使用此命令仅保留当前光标所在窗口,
"                     关闭所有其他窗口.
"
" ** 对于已打开文件(buffer)的操作:
"                :ls  查看 buffer 列表.
"                :bn  切换到下一个 buffer.
"                :bp  切换到上一个 buffer.
"                :bd  删除 buffer.
"               :b 1  切换到1号 buffer.
"             :b abc  切换到文件名以 abc 开头的 buffer.
"
" ** 其他:
"              :help  顶部分屏打开帮助文档窗口.
"             :[tab]  command-line 模式下要擅用 tab 补全.
"          :x/:wq/ZZ  保存并退出文件.
"                 :q  不保存退出文件或关闭窗口.
"                 :!  后面输入要执行的系统命令, 回车执行.
"                  .  重复执行最近一次的修改动作.
"                  /  正向搜索模式.
"                  ?  反向搜索模式.
"                n/N  配合上面两个命令, 正向/方向跳转到搜索关键字.
"             ctrl g  显示光标所在文件的全路径, 当前文件一共多少行,
"                     光标所在行是当前文件的百分之多少的位置.
"             ctrl f  command-line 模式下,
"                     按快捷键 ctrl f 打开命令行窗口并显示命令历史记录.
"                 q:  normal 模式下,
"                     按快捷键 q: 打开命令行窗口并显示命令历史记录.
"                 q/  normal 模式下,
"                     按快捷键 q/ 将会打开命令行窗口并显示向下搜索的历史记录.
"                 q?  normal 模式下,
"                     按快捷键 q? 将会打开命令行窗口并显示向上搜索的历史记录.
"                 z=  当你拼写一个不熟悉的英文单词时, 可以使用此快捷键给出建议列表.
"               "ayy  将当前行拷贝到寄存器 a, a 也可以是其他字符,
"                     yy 动作也可以是其他拷贝动作.
"                "ap  将寄存器 a 中的内容粘贴到光标所在处,
"                     我们可以拷贝不同内容到不同的寄存器,
"                     粘贴时分别选择相应的寄存器的内容进行粘贴.
"               :reg  查看当前 VIM 实例的寄存器列表.
"
" ** 不依赖插件的自定义配置提供的功能:
"                  Y  这个命令默认是复制整行的意思,
"                     这里更改为复制光标位置到行结尾的内容.
"          ctrl bfpn  insert 模式下左右上下移动光标.
"           ctrl a/e  insert 模式下跳转到行首/行尾.
"      , )/]/}/"/'/`  将 visual 模式下选择的内容使用
"                     () 或 [] 或 {} 或 "" 或 '' 或 `` 包裹.
"       ctrl j/k/h/l  光标移动到 下面/上面/左边/右边 的窗口.
"                 ,R  文件 ~/.vimrc 发生变化后, 正在编辑的文件不需要退出,
"                     通过该快捷键即可重新加载 VIM 配置文件, 使变更马上生效.
"                 ,E  上下分屏方式打开 ~/.vimrc 文件.

" }}

"""""""""" 插件提供的部分能力 {{
"
" ** neoclide/coc.nvim (https://github.com/neoclide/coc.nvim)
"                 gd  跳转到定义处, `ctrl o`跳转回来, `ctrl i`再跳转过去.
"                 gy  跳转到类型定义处.
"                 gi  跳转到接口实现处.
"                 gr  在 location list 中列出相关条目, 如果只有1条, 则直接跳转过去.
"                  K  使用 K 在预览窗口中查看文档.
"
" ** coc-translator (https://github.com/voldikss/coc-translator)
"                 ts  normal 和 visual 模式下,
"                     将光标下的单词以弹出漂浮窗口的方式显示翻译结果.
"                tse  在状态栏下面显示翻译的结果.
"                tsr  将翻译结果替换掉光标下的单词.
"
" ** dense-analysis/ale (https://github.com/dense-analysis/ale)
"                 :w  保存代码文件的时候, 将自动检查语法错误并提示.
"           , k/j  向上或向下跳转到下一个错误提示的位置.
"
" ** Yggdroot/LeaderF (https://github.com/Yggdroot/LeaderF)
"                ,ff  进入文件搜索的模糊搜索方式;
"             ctrl r  在 ,ff 命令的基础上, 按这个快捷键进入文件搜索的正则匹配方式;
"                ,fb  搜索当前已经打开的所有文件的内容.
"                ,fm  显示最近打开过的文件列表.
"                ,ft  显示当前文件的 tags 列表.
"                ,fl  显示当前文件的去除空行的所有行.
"                ,rg  从 normal 模式下按 ,rg 进入 command-line 模式下,
"                     然后输入要搜索的文本(支持正则表达式),
"                     回车即可显示此项目内包含此文本的文件列表;
"                     在弹出的结果窗口中, 按 gi 可以将光标移动到输入框,
"                     可以继续输入内容缩小结果列表,
"                     然后按 tab 进入结果列表中, 按 j/k 上下选择, 选择一个文件后,
"                     按 t 将以新建标签页的方式打开选择的文件.
"                 rg  visual 模式下选择文本后, 按 rg 在整个项目内搜索选择的文本,
"                     显示搜索结果.
"                ,rc  ,rg/rg 搜索内容关闭后, 想再次搜索上次搜索的内容,
"                     normal 模式下按 ,rc 即可.
" ** terryma/vim-multiple-cursors (https://github.com/mg979/vim-visual-multi)
"             ctrl n  开启多光标模式, 默认对应 VIM 的 visual 模式.
"                n/N  开启多光标模式后, 按 n/N 向下或向上选择光标下的单词.
"                  q  取消选择当前行的目标单词并同时选择下一行的目标单词.
"                  Q  不选择当前行的目标单词.
"                tab  在多光标的 visual 模式和多光标的 normal 模式之间切换.
"              c/d/i  多光标选择完目标单词后, 对目标单词进行修改.
"                ESC  退出多光标模式.
"
" ** easymotion/vim-easymotion (https://github.com/easymotion/vim-easymotion)
"                ,s  按此快捷键后, 再输入一个光标要跳转到的字符 x,
"                    你会发现 x 变成了另外一个字符 g, 你直接输入 g 即可完成跳转.
"                ,w  标记所有窗口的单词.
"                ,L  标记所有窗口的所有行首字符.
"                ,l  标记当前行光标右侧的字符.
"                ,h  标记当前行光标左侧的字符.
"                 s  输入1个目标字符即可高亮定位, 支持多窗口同时定位.
"                 /  覆盖了 VIM 自带的 / 搜索模式.
"
" ** preservim/nerdcommenter (https://github.com/preservim/nerdcommenter)
"       [n],c<space>  注释或取消注释光标所在行,
"                     或 visual 模式下选择多行来注释或取消注释.
"             [n],cc  只注释, 如果原来就有注释则多一层注释.
"             [n],cm  对被选区域用一对注释符进行注释, 比如由 // 改为 /* */.
"             [n],cs  添加较美观的注释.
"             [n],cy  添加注释并复制被被注释的部分.
"             [n],cA  跳转到该行结尾添加注释符号，并进入 insert 模式.
"
" ** fatih/vim-go (https://github.com/fatih/vim-go/wiki/Tutorial) 只适用于Go
"   代码阅读相关:
"                 ,d  上下分屏查看光标所在函数等的文档,
"                     如果设置了 let g:go_doc_popup_window = 1, 则弹出浮窗.
"                  K  同 ,d 并且显示速度更快, 建议优先使用.
"                ,dv  左右分屏查看光标所在函数等的文档,
"                     如果设置了let g:go_doc_popup_window = 1, 则弹出浮窗.
"                 gr  在 location list 中列出哪些地方引用了光标所在的对象.
"                ,cl  在 location list 中列出哪些地方调用了光标所在的函数.
"                 ,s  查看光标所在的类型实现了哪些接口,
"                     注意光标只能在类型或类型的方法上.
"
"   跳转到对象(函数)定义或声明处的几种方式:
"                 gd  覆盖当前页面.
"                 gl  新开一个标签页.
"                 gs  在上方分屏.
"                 gv  在右侧分屏.
"
"   代码自动生成相关:
"                ,im  自动为光标下的类型生成指定接口的实现方法.
"                ,ki  自动把光标所在的结构体字面量(仅有value没有key的情况)补充上字段.
"                ,fs  自动把光标所在的结构体字面量, 以字段零值方式补上尚未填写的字段.
"                ,ie  自动生成 if err != nil 代码段.
"                ,at  为光标所在的结构体定义自动生成字段对应的tags.
"                ,rn  级联的重命名光标下的标识符, 重命名后,
"                     项目内的所有与其相关的地方全部会更新.
"
"   代码运行相关:
"                ,gr  go run 当前的go文件.
"                ,gb  go build 当前的go文件, 不产生二进制文件,
"                     只是检查是否可以成功build.
"                ,gt  go test 当前的go文件.
"                ,gc  查看当前代码文件的测试覆盖率.
"
" ** scrooloose/nerdtree (https://github.com/preservim/nerdtree)
"                 ,x  打开或关闭左侧目录树.
"                  q  关闭目录树窗口.
"                  ?  打开/关闭该插件的帮助文档.
"                o/O  展开目录/递归的展开目录, 原地再按一次则对应关闭目录.
"                x/X  闭合目录/闭合递归展开的目录,
"                     进行此操作时, 光标应该在要闭合的目录中.
"                t/T  以标签页形式打开/静默打开文件,
"                     如果光标在空目录上则新创建一个空文件并打开,
"                     然后使用 :w newfilename 来保存文件, 最后 r 来更新左侧目录树的显示.
"              gt/gT  向右/向左切换标签页.
"                3gt  切换到第3个标签, 切换到其他标签的方法类似.
"          shift l/h  向右/向左切换标签页, 是在.vimrc中配置的上一条快捷键的映射.
"          3 shift l  切换到第3个标签.
"                  R  变更目录名称后, 更新目录树中的目录显示.
"                 CD  如果当前目录树的根目录包含了很多项目,
"                     如果要将某个项目设置为目录树的根,
"                     则选择这个项目目录, 按 CD.
"                 go  选择一个文件, 按 go 只是在当前窗口展示这个文件的内容,
"                     光标还停留在目录树窗口.
"                  I  显示/隐藏以 . 开头的文件.
"                  m  光标移动到某个文件或目录, 按 m 展示可操作的 menu 列表,
"                     选择你要的操作, 比如删除/添加/移动文件或目录等,
"                     使用 ESC 中途退出操作.
"
" ** majutsushi/tagbar (https://github.com/preservim/tagbar)
"                 ,e  打开右侧大纲窗口.
"
" ** tpope/vim-fugitive (https://github.com/tpope/vim-fugitive)
"           :Gstatus
"        :Git status  类似 git status.
"              :Glog
"           :Git log  类似 git log, 光标移动到一个 commit 行,
"                     然后按 o 或 O 或 enter, 打开 commit 详细内容浏览,
"                     q 退出浏览窗口, ctrl o/i 来回跳转.
"            :Gblame
"         :Git blame  类似 git blame.
"          :Git diff  类似 git diff.
"                     等等, 都可以直接在 VIM 的 command-line 模式运行.
"
" ** junegunn/gv.vim (https://github.com/junegunn/gv.vim)
"                :GV  类似 :Git log.
"               :GV!  这个只看当前文件的 git log.

" ** tpope/vim-surround (https://github.com/tpope/vim-surround)
"               ysw"  使光标所在单词使用 " 包裹, 不包括光标前的字符.
"              ysiw"  光标所在的完整单词使用 " 包裹, 包括光标前的字符.
"              ysiW"  以空格作为分隔符来作为单词, 特殊符号也可以作为单词的一部分了.
"              ys3w"  以光标所在位置为起始位置向右的3个单词使用 " 包裹.
"               yss"  以光标所在行为单位包裹.
"                ds"  删除光标周围的双引号.
"               cs"'  把光标所在周围的双引号替换为单引号.
"               cst'  将类似 <div>hello world</div> 变为 'hello world'.
"
" ** mattn/emmet-vim (https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL)
"           ctrl y ,  打开 *.html 文件:
"                     1) 输入 html:5 然后按此快捷键, 即可自动生成 html 代码模版.
"                     2) 输入 div 然后按此快捷键, 即可自动生成: <div></div>
"                     3) 输入 #foo 然后按此快捷键, 可自动生成: <div id="foo"></div>
"                     4) 输入 div>p>a , 然后按此快捷键, 可自动生成:
"                        <div><p><a href=""></a></p></div>
"
" ** instant-markdown/vim-instant-markdown (https://github.com/instant-markdown/vim-instant-markdown)
"                 ,p  打开浏览器预览当前的 markdown 文件.
"                ,,p  关闭预览.
"
" ** dhruvasagar/vim-table-mode (https://github.com/dhruvasagar/vim-table-mode)
"                ,tm  开启或关闭 table mode.
"                 ||  在 insert 模式下, 输入 || 后按 ESC 来开启 table mode.
"                 __  在 insert 模式下, 输入 __ 后按 ESC 来关闭 table mode.
"
" ** voldikss/vim-floaterm (https://github.com/voldikss/vim-floaterm)
"                 ,t  显示或隐藏悬浮终端窗口, 如果悬浮窗口还不存在则新建.
"                ,tc  新建一个悬浮窗口.
"                ,tk  关闭当前悬浮窗口.
"                ,tn  切换到下一个悬浮窗口.
"                ,ts 显示目前存在的悬浮窗口.
"
" }}

"""""""""" 实例练习 {{
"
" ** 将`one two three four five six`改为`"one","two","four","five","six"`
"                  ^  光标移动到第一个非空字符.
"           f<space>  光标移动到第一个空格.
"                 cl  删除1个空格并进入到 insert 模式,
"                     输入 "," 之后按 ESC 进入到 normal 模式.
"                  ;  光标跳转到下一个空格.
"                  .  重复执行步骤3, 然后 ; 和 . 重复多次直到将所有空格都替换成 ",".
"                  I  将光标跳转到行首并进入到 insert 模式,
"                     输入 " 之后按 ESC 进入到 normal 模式.
"                  A  将光标跳转到行尾并进入到 insert 模式,
"                     输入 " 之后按 ESC 进入到 normal 模式.
"
" ** 把文件内的某个连续的行尾/或行首加上逗号:
"             ctrl v  进入 visual block 模式, 选择要操作的那些连续行.
"                  $  移动到行尾.
"                I/A  进入 insert 模式, 光标在 行首/行尾, 输入要增加的字符 `,`.
"            ESC ESC  连续按2次 ESC 即可.
"
" ** 将多行合并成1行:
"         v/V/ctrl v  进入 visual 或 visual line 或 visual block 模式.
"                  J  合并成1行.
"
" ** 本地编辑器之间的复制和粘贴:
"       [n]yy / Y 或 v 选择文本使用y复制等复制命令需要的文本对象,
"       此时默认已复制到本地系统剪贴板,
"       可在本文件、其他 VIM 实例文件 normal 模式下按 p/P 来粘贴,
"       或 insert 模式下`command v`粘贴,
"       或操作系统上的任何文本框内进行`command v`粘贴.
"
" ** 通过 SSH 远程管理的 Linux 系统下使用 VIM 时的复制和粘贴:
"       远程 Linux 系统 VIM 实例 normal 模式下(适用于使用termimal,
"       如果是iterm2则任何模式均可), 需要使用鼠标(或option+command+鼠标)选择文本,
"       通过 command c 将选中文本复制到 macOS 本地的剪贴板,
"       最后通过 command v 粘贴到本地各应用的文本输入框.
"
" ** 宏的使用方法举例, 比如给文本的每一行的行首和行尾都加上双引号:
"       normal 模式下按 qa,  其中 q 是宏指令, 表明开始录制宏, a 为宏的名称,
"       可以是 a-z 的任何字母, 然后我们给一行的行首和行尾都加上双引号,
"       最后 normal 模式下`q`, 表示结束宏的录制;
"       接下来我们把这个宏 a 运用在每一行上, 我们选择文本所有的行,
"       然后 command-line 模式`:normal @a`,
"       或者`:% normal @a`(%表示所有行), 这样所有行就都完成双引号包裹了.
"
" }}

"""""""""" 注意事项 {{
"
"   1. python-mode/python-mode  建议不要使用这个插件, 不太好用,
"      文档显示方式很蹩脚, 会影响到 coc-jedi 的正常发挥, coc-jedi 足矣.
"
" }}

" }}
