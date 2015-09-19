    "来源网址http://blog.csdn.net/tietao/article/details/6862341
    "=========================================================================  
    " DesCRiption: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console  
    "  
    " Last Change: 2010年08月02日 15时13分   
    "  
    " Version:     1.80  
    "  
    "=========================================================================  
      
    set nocompatible            " 关闭 vi 兼容模式  
    syntax on                   " 自动语法高亮  
    "colorscheme evening         " 设定配色方案  
    set number                  " 显示行号  
    "set cursorline              " 突出显示当前行  
    "set ruler                   " 打开状态栏标尺  
    set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4  
    set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格  
    set tabstop=4               " 设定 tab 长度为 4  
    set nobackup                " 覆盖文件时不备份  
    set autochdir               " 自动切换当前目录为当前文件所在的目录  
    filetype plugin indent on   " 开启插件  
    set backupcopy=yes          " 设置备份时的行为为覆盖  
    set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感  
    set nowrapscan              " 禁止在搜索到文件两端时重新搜索  
    set incsearch               " 输入搜索内容时就显示搜索结果  
    set hlsearch                " 搜索时高亮显示被找到的文本  
    set noerrorbells            " 关闭错误信息响铃  
    set novisualbell            " 关闭使用可视响铃代替呼叫  
    set t_vb=                   " 置空错误铃声的终端代码  
    " set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号  
    " set matchtime=2             " 短暂跳转到匹配括号的时间  
    set magic                   " 设置魔术  
    set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存  
    set guioptions-=T           " 隐藏工具栏  
    set guioptions-=m           " 隐藏菜单栏  
    set smartindent             " 开启新行时使用智能自动缩进  
    set backspace=indent,eol,start  
                                " 不设定在插入状态无法用退格键和 Delete 键删除回车符  
    set cmdheight=1             " 设定命令行的行数为 1  
    "set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)  
    set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\   
                                " 设置在状态行显示的信息  
   " set foldenable              " 开始折叠  
   " set foldmethod=syntax       " 设置语法折叠  
   " set foldcolumn=0            " 设置折叠区域的宽度  
   " setlocal foldlevel=1        " 设置折叠层数为  
    " set foldclose=all           " 设置为自动关闭折叠                              
    " nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>  
                                " 用空格键来开关折叠  
      
    " return OS type, eg: windows, or linux, mac, et.st..  
    function! MySys()  
        if has("win16") || has("win32") || has("win64") || has("win95")  
            return "windows"  
        elseif has("unix")  
            return "linux"  
        endif  
    endfunction  
      
    " 用户目录变量$VIMFILES  
    if MySys() == "windows"  
        let $VIMFILES = $VIM.'/vimfiles'  
    elseif MySys() == "linux"  
        let $VIMFILES = $HOME.'/.vim'  
    endif  
      
    " 设定doc文档目录  
    let helptags=$VIMFILES.'/doc'  
      
    " 设置字体 以及中文支持  
    if has("win32")  
        set guifont=Inconsolata:h12:cANSI  
    endif  
      
    " 配置多语言环境  
    if has("multi_byte")  
        " UTF-8 编码  
        set encoding=utf-8  
        set termencoding=utf-8  
        set formatoptions+=mM  
        set fencs=utf-8,gbk "here can add argment to spurt the chinese  
      
        if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'  
            set ambiwidth=double  
        endif  
      
        if has("win32")  
            source $VIMRUNTIME/delmenu.vim  
            source $VIMRUNTIME/menu.vim  
            language messages zh_CN.utf-8  
        endif  
    else  
        echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"  
    endif  
      
    " Buffers操作快捷方式!  
    nnoremap <C-RETURN> :bnext<CR>  
    nnoremap <C-S-RETURN> :bprevious<CR>  
      
    " Tab操作快捷方式!  
    nnoremap <C-TAB> :tabnext<CR>  
    nnoremap <C-S-TAB> :tabprev<CR>  
      
    "关于tab的快捷键  
    " map tn :tabnext<cr>  
    " map tp :tabprevious<cr>  
    " map td :tabnew .<cr>  
    " map te :tabedit  
    " map tc :tabclose<cr>  
      
    "窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动  
    "光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的  
    "时候会变得非常方便.  
    nnoremap <C-h> <C-w>h  
    nnoremap <C-j> <C-w>j  
    nnoremap <C-k> <C-w>k  
    nnoremap <C-l> <C-w>l  
      
    "一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）  
    nnoremap <leader>1 :set filetype=xhtml<CR>  
    nnoremap <leader>2 :set filetype=css<CR>  
    nnoremap <leader>3 :set filetype=javascript<CR>  
    nnoremap <leader>4 :set filetype=php<CR>  
      
    " set fileformats=unix,dos,mac  
    " nmap <leader>fd :se fileformat=dos<CR>  
    " nmap <leader>fu :se fileformat=unix<CR>  
      
    " use Ctrl+[l|n|p|cc] to list|next|previous|jump to count the result  
    " map <C-x>l <ESC>:cl<CR>  
    " map <C-x>n <ESC>:cn<CR>  
    " map <C-x>p <ESC>:cp<CR>  
    " map <C-x>c <ESC>:cc<CR>  
      
      
    " 让 Tohtml 产生有 CSS 语法的 html  
    " syntax/2html.vim，可以用:runtime! syntax/2html.vim  
    let html_use_css=1  
      
    " Python 文件的一般设置，比如不要 tab 等  
    autocmd FileType python set tabstop=4 shiftwidth=4 expandtab  
    autocmd FileType python map <F12> :!python %<CR>  
      
    " 选中状态下 Ctrl+c 复制  
    vmap <C-c> "+y  
      
    " 打开javascript折叠  
    let b:javascript_fold=1  
    " 打开javascript对dom、html和css的支持  
    let javascript_enable_domhtmlcss=1  
    " 设置字典 ~/.vim/dict/文件的路径  
    autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict  
    autocmd filetype css set dictionary=$VIMFILES/dict/css.dict  
    autocmd filetype php set dictionary=$VIMFILES/dict/php.dict  
      
    "-----------------------------------------------------------------  
    " plugin - bufexplorer.vim Buffers切换  
    " \be 全屏方式查看全部打开的文件列表  
    " \bv 左右方式查看   \bs 上下方式查看  
    "-----------------------------------------------------------------  
      
      
    "-----------------------------------------------------------------  
    " plugin - taglist.vim  查看函数列表，需要ctags程序  
    " F4 打开隐藏taglist窗口  
    "-----------------------------------------------------------------  
    if MySys() == "windows"                " 设定windows系统中ctags程序的位置  
        let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'  
    elseif MySys() == "linux"              " 设定windows系统中ctags程序的位置  
        let Tlist_Ctags_Cmd = '/usr/bin/ctags'  
    endif  
    nnoremap <silent><F4> :TlistToggle<CR>  
    let Tlist_Show_One_File = 1            " 不同时显示多个文件的tag，只显示当前文件的  
    let Tlist_Exit_OnlyWindow = 1          " 如果taglist窗口是最后一个窗口，则退出vim  
    let Tlist_Use_Right_Window = 1         " 在右侧窗口中显示taglist窗口  
    let Tlist_File_Fold_Auto_Close=1       " 自动折叠当前非编辑文件的方法列表  
    let Tlist_Auto_Open = 0  
    let Tlist_Auto_Update = 1  
    let Tlist_Hightlight_Tag_On_BufEnter = 1  
    let Tlist_Enable_Fold_Column = 0  
    let Tlist_Process_File_Always = 1  
    let Tlist_Display_Prototype = 0  
    let Tlist_Compact_Format = 1  
      
      
    "-----------------------------------------------------------------  
    " plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。  
    " \m  mark or unmark the word under (or before) the cursor  
    " \r  manually input a regular expression. 用于搜索.  
    " \n  clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .  
    " \*  当前MarkWord的下一个     \#  当前MarkWord的上一个  
    " \/  所有MarkWords的下一个    \?  所有MarkWords的上一个  
    "-----------------------------------------------------------------  
      
      
    "-----------------------------------------------------------------  
    " plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录  
    " :ERDtree 打开NERD_tree         :NERDtreeClose    关闭NERD_tree  
    " o 打开关闭文件或者目录         t 在标签页中打开  
    " T 在后台标签页中打开           ! 执行此文件  
    " p 到上层目录                   P 到根目录  
    " K 到第一个节点                 J 到最后一个节点  
    " u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）  
    " r 递归刷新当前目录             R 递归刷新当前根目录  
    "-----------------------------------------------------------------  
    " F3 NERDTree 切换  
    map <F3> :NERDTreeToggle<CR>  
    imap <F3> <ESC>:NERDTreeToggle<CR>  
      
      
    "-----------------------------------------------------------------  
    " plugin - NERD_commenter.vim   注释代码用的，  
    " [count],cc 光标以下count行逐行添加注释(7,cc)  
    " [count],cu 光标以下count行逐行取消注释(7,cu)  
    " [count],cm 光标以下count行尝试添加块注释(7,cm)  
    " ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。  
    " 注：count参数可选，无则默认为选中行或当前行  
    "-----------------------------------------------------------------  
    let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格  
    let NERDCompactSexyComs=1   " 多行注释时样子更好看  
      
      
    "-----------------------------------------------------------------  
    " plugin - DoxygenToolkit.vim  由注释生成文档，并且能够快速生成函数标准注释  
    "-----------------------------------------------------------------  
    let g:DoxygenToolkit_authorName="Asins - asinsimple AT gmail DOT com"  
    let g:DoxygenToolkit_briefTag_funcName="yes"  
    map <leader>da :DoxAuthor<CR>  
    map <leader>df :Dox<CR>  
    map <leader>db :DoxBlock<CR>  
    map <leader>dc a /*  */<LEFT><LEFT><LEFT>  
      
      
    "-----------------------------------------------------------------  
    " plugin – ZenCoding.vim 很酷的插件，HTML代码生成  
    " 插件最新版：http://github.com/mattn/zencoding-vim  
    " 常用命令可看：http://nootn.com/blog/Tool/23/  
    "-----------------------------------------------------------------  
      
      
    "-----------------------------------------------------------------  
    " plugin – checksyntax.vim    JavaScript常见语法错误检查  
    " 默认快捷方式为 F5  
    "-----------------------------------------------------------------  
    let g:checksyntax_auto = 0 " 不自动检查  
      
      
    "-----------------------------------------------------------------  
    " plugin - NeoComplCache.vim    自动补全插件  
    "-----------------------------------------------------------------  
    let g:AutoComplPop_NotEnableAtStartup = 1  
    let g:NeoComplCache_EnableAtStartup = 1  
    let g:NeoComplCache_SmartCase = 1  
    let g:NeoComplCache_TagsAutoUpdate = 1  
    let g:NeoComplCache_EnableInfo = 1  
    let g:NeoComplCache_EnableCamelCaseCompletion = 1  
    let g:NeoComplCache_MinSyntaxLength = 3  
    let g:NeoComplCache_EnableSkipCompletion = 1  
    let g:NeoComplCache_SkipInputTime = '0.5'  
    let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'  
    " <TAB> completion.  
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"  
    " snippets expand key  
    imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)  
    smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)  
      
      
    "-----------------------------------------------------------------  
    " plugin - matchit.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转  
    " % 正向匹配      g% 反向匹配  
    " [% 定位块首     ]% 定位块尾  
    "-----------------------------------------------------------------  
      
      
    "-----------------------------------------------------------------  
    " plugin - vcscommand.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转  
    " SVN/git管理工具  
    "-----------------------------------------------------------------  
      
      
    "-----------------------------------------------------------------  
    " plugin – a.vim  
    "-----------------------------------------------------------------  
    
    
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"          _
"      __ | \
"     /   | /
"     \__ | \
" by Amix - http://amix.dk/
"
" Maintainer: Amir Salihefendic <amix3k at gmail.com>
" Version: 2.7
" Last Change: 12/10/06 00:09:21
"
" Sections:
" ----------------------
" General
" Colors and Fonts
" Fileformats
" VIM userinterface
"    Statusline
" Visual
" Moving around and tabs
" General Autocommands
" Parenthesis/bracket expanding
" General Abbrevs
" Editing mappings etc.
" Command-line config
" Buffer realted
" Files and backups
" Folding
" Text options
"    Indent
" Spell checking
" Plugin configuration
"    Yank ring
"    File explorer
"    Minibuffer
"    Tag list (ctags) - not used
"    LaTeX Suite things
" Filetype generic
"    Todo
"    VIM
"    HTML related
"    Ruby & PHP section
"    Python section
"    Cheetah section
"    Vim section
"    Java section
"    JavaScript section
"    C mappings
"    SML
"    Scheme bindings
" Snippets
"    Python
"    javaScript
" Cope
" MISC
"
"  Tip:
"   If you find anything that you can't understand than do this:
"   help keyword OR helpgrep keywords
"  Example:
"   Go into command-line mode and type helpgrep nocompatible, ie.
"   :helpgrep nocompatible
"   then press <leader>c to see the results, or :botright cw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

"Sets how many lines of history VIM har to remember
set history=400

"Enable filetype plugin
filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time:
set mouse=a

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Fast saving
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

"Fast reloading of the .vimrc
map <leader>s :source ~/vim_local/vimrc<cr>
"Fast editing of .vimrc
map <leader>e :e! ~/vim_local/vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/vim_local/vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable

"Set font to Monaco 10pt
if MySys() == "mac"
  set gfn=Bitstream\ Vera\ Sans\ Mono:h14
  set nomacatsui
  set termencoding=macroman
elseif MySys() == "linux"
  set gfn=Monospace\ 11
endif

if has("gui_running")
  set guioptions-=T
  let psc_style='cool'
  colorscheme ps_color
else
  set background=dark
  colorscheme zellner
endif

"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>1 :set syntax=cheetah<cr>
map <leader>2 :set syntax=xhtml<cr>
map <leader>3 :set syntax=python<cr>
map <leader>4 :set ft=javascript<cr>
map <leader>$ :syntax sync fromstart<cr>

autocmd BufEnter * :syntax sync fromstart

"Highlight current
if has("gui_running")
  set cursorline
  hi cursorline guibg=#333333
  hi CursorColumn guibg=#333333
endif

"Omni menu colors
hi Pmenu guibg=#333333
hi PmenuSel guibg=#555555 guifg=#ffffff


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetypes
set ffs=unix,dos,mac

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
set so=7

"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 2 high
set cmdheight=2

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
set lz

"Change buffer - without saving
set hid

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Ignore case when searching
set ignorecase
set incsearch

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"show matching bracets
set showmatch

"How many tenths of a second to blink
set mat=2

"Highlight search things
set hlsearch

  """"""""""""""""""""""""""""""
  " Statusline
  """"""""""""""""""""""""""""""
  "Always hide the statusline
  set laststatus=2

  function! CurDir()
     let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
     return curdir
  endfunction

  "Format the statusline
  set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c



""""""""""""""""""""""""""""""
" Visual
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
map <space> /
map <c-space> ?

"Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Actually, the tab does not switch buffers, but my arrows
"Bclose function ca be found in "Buffer related" section
map <leader>bd :Bclose<cr>
map <down> <leader>bd
"Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

"Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
try
  set switchbuf=usetab
  set stal=2
catch
endtry

"Moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i
imap <D-$> <esc>$a
imap <D-0> <esc>0i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Switch to current dir
map <leader>cd :cd %:p:h<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
")
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $w <esc>`>a"<esc>`<i"<esc>

"Map auto complete of (, ", ', [
inoremap $1 ()<esc>:let leavechar=")"<cr>i
inoremap $2 []<esc>:let leavechar="]"<cr>i
inoremap $4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap $3 {}<esc>:let leavechar="}"<cr>i
inoremap $q ''<esc>:let leavechar="'"<cr>i
inoremap $w ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(vim\)\@! inoremap " ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(txt\)\@! inoremap ' ''<esc>:let leavechar="'"<cr>i

imap <m-l> <esc>:exec "normal f" . leavechar<cr>a
imap <d-l> <esc>:exec "normal f" . leavechar<cr>a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My information
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab xname Amir Salihefendic


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using control
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if MySys() == "mac"
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

set completeopt=menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Cwd()
  let cwd = getcwd()
  return "e " . cwd
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  if MySys() == "linux" || MySys() == "mac"
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if MySys() == "linux" || MySys() == "mac"
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

"Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./

cno $q <C-\>eDeleteTillSlash()<cr>

cno $c e <C-\>eCurrentFileDir("e")<cr>

cno $tc <C-\>eCurrentFileDir("tabnew")<cr>
cno $th tabnew ~/
cno $td tabnew ~/Desktop/

"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast open a buffer by search for a name
map <c-q> :sb

"Open a dummy buffer for paste
map <leader>q :e ~/buffer<cr>

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Buffer - reverse everything ... :)
map <F9> ggVGg?

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
set nofen
set fdl=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2

map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>
au FileType html,python,vim,javascript setl shiftwidth=2
au FileType html,python,vim,javascript setl tabstop=2
au FileType java setl shiftwidth=4
au FileType java setl tabstop=4

set smarttab
set lbr
set tw=500

   """"""""""""""""""""""""""""""
   " Indent
   """"""""""""""""""""""""""""""
   "Auto indent
   set ai

   "Smart indet
   set si

   "C-style indeting
   set cindent

   "Wrap lines
   set wrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   """"""""""""""""""""""""""""""
   " Vim Grep
   """"""""""""""""""""""""""""""
   let Grep_Skip_Dirs = 'RCS CVS SCCS .svn'
   let Grep_Cygwin_Find = 1

   """"""""""""""""""""""""""""""
   " Yank Ring
   """"""""""""""""""""""""""""""
   map <leader>y :YRShow<cr>

   """"""""""""""""""""""""""""""
   " File explorer
   """"""""""""""""""""""""""""""
   "Split vertically
   let g:explVertical=1

   "Window size
   let g:explWinSize=35

   let g:explSplitLeft=1
   let g:explSplitBelow=1

   "Hide some files
   let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'

   "Hide the help thing..
   let g:explDetailedHelp=0


   """"""""""""""""""""""""""""""
   " Minibuffer
   """"""""""""""""""""""""""""""
   let g:miniBufExplModSelTarget = 1
   let g:miniBufExplorerMoreThanOne = 2
   let g:miniBufExplModSelTarget = 0
   let g:miniBufExplUseSingleClick = 1
   let g:miniBufExplMapWindowNavVim = 1
   let g:miniBufExplVSplit = 25
   let g:miniBufExplSplitBelow=1

   let g:bufExplorerSortBy = "name"

   autocmd BufRead,BufNew :call UMiniBufExplorer


   """"""""""""""""""""""""""""""
   " Tag list (ctags) - not used
   """"""""""""""""""""""""""""""
   "let Tlist_Ctags_Cmd = "/sw/bin/ctags-exuberant"
   "let Tlist_Sort_Type = "name"
   "let Tlist_Show_Menu = 1
   "map <leader>t :Tlist<cr>


   """"""""""""""""""""""""""""""
   " LaTeX Suite things
   """"""""""""""""""""""""""""""
   set grepprg=grep\ -nH\ $*
   let g:Tex_DefaultTargetFormat="pdf"
   let g:Tex_ViewRule_pdf='xpdf'

   "Bindings
   autocmd FileType tex map <silent><leader><space> :w!<cr> :silent! call Tex_RunLaTeX()<cr>

   "Auto complete some things ;)
   autocmd FileType tex inoremap $i \indent
   autocmd FileType tex inoremap $* \cdot
   autocmd FileType tex inoremap $i \item
   autocmd FileType tex inoremap $m \[<cr>\]<esc>O


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " Todo
   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   au BufNewFile,BufRead *.todo so ~/vim_local/syntax/amido.vim

   """"""""""""""""""""""""""""""
   " VIM
   """"""""""""""""""""""""""""""
   autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>


   """"""""""""""""""""""""""""""
   " HTML related
   """"""""""""""""""""""""""""""
   " HTML entities - used by xml edit plugin
   let xml_use_xhtml = 1
   "let xml_no_auto_nesting = 1

   "To HTML
   let html_use_css = 1
   let html_number_lines = 0
   let use_xhtml = 1


   """"""""""""""""""""""""""""""
   " Ruby & PHP section
   """"""""""""""""""""""""""""""
   autocmd FileType ruby map <buffer> <leader><space> :w!<cr>:!ruby %<cr>
   autocmd FileType php compiler php
   autocmd FileType php map <buffer> <leader><space> <leader>cd:w<cr>:make %<cr>


   """"""""""""""""""""""""""""""
   " Python section
   """"""""""""""""""""""""""""""
   "Run the current buffer in python - ie. on leader+space
   au FileType python so ~/vim_local/syntax/python.vim
   autocmd FileType python map <buffer> <leader><space> :w!<cr>:!python %<cr>
   autocmd FileType python so ~/vim_local/plugin/python_fold.vim

   "Set some bindings up for 'compile' of python
   autocmd FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
   autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

   "Python iMaps
   au FileType python set cindent
   au FileType python inoremap <buffer> $r return
   au FileType python inoremap <buffer> $s self
   au FileType python inoremap <buffer> $c ##<cr>#<space><cr>#<esc>kla
   au FileType python inoremap <buffer> $i import
   au FileType python inoremap <buffer> $p print
   au FileType python inoremap <buffer> $d """<cr>"""<esc>O

   "Run in the Python interpreter
   function! Python_Eval_VSplit() range
     let src = tempname()
     let dst = tempname()
     execute ": " . a:firstline . "," . a:lastline . "w " . src
     execute ":!python " . src . " > " . dst
     execute ":pedit! " . dst
   endfunction
   au FileType python vmap <F7> :call Python_Eval_VSplit()<cr>

   """"""""""""""""""""""""""""""
   " Cheetah section
   """""""""""""""""""""""""""""""
   autocmd FileType cheetah set ft=xml
   autocmd FileType cheetah set syntax=cheetah

   """""""""""""""""""""""""""""""
   " Vim section
   """""""""""""""""""""""""""""""
   autocmd FileType vim set nofen

   """""""""""""""""""""""""""""""
   " Java section
   """""""""""""""""""""""""""""""
   au FileType java inoremap <buffer> <C-t> System.out.println();<esc>hi

   "Java comments
   autocmd FileType java source ~/vim_local/macros/jcommenter.vim
   autocmd FileType java let b:jcommenter_class_author='Amir Salihefendic (amix@amix.dk)'
   autocmd FileType java let b:jcommenter_file_author='Amir Salihefendic (amix@amix.dk)'
   autocmd FileType java map <buffer> <F2> :call JCommentWriter()<cr>

   "Abbr'z
   autocmd FileType java inoremap <buffer> $pr private
   autocmd FileType java inoremap <buffer> $r return
   autocmd FileType java inoremap <buffer> $pu public
   autocmd FileType java inoremap <buffer> $i import
   autocmd FileType java inoremap <buffer> $b boolean
   autocmd FileType java inoremap <buffer> $v void
   autocmd FileType java inoremap <buffer> $s String

   "Folding
   function! JavaFold()
     setl foldmethod=syntax
     setl foldlevelstart=1
     syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
     syn match foldImports /\(\n\?import.\+;\n\)\+/ transparent fold

     function! FoldText()
       return substitute(getline(v:foldstart), '{.*', '{...}', '')
     endfunction
     setl foldtext=FoldText()
   endfunction
   au FileType java call JavaFold()
   au FileType java setl fen

   au BufEnter *.sablecc,*.scc set ft=sablecc

   """"""""""""""""""""""""""""""
   " JavaScript section
   """""""""""""""""""""""""""""""
   au FileType javascript so ~/vim_local/syntax/javascript.vim
   function! JavaScriptFold()
     setl foldmethod=syntax
     setl foldlevelstart=1
     syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

     function! FoldText()
       return substitute(getline(v:foldstart), '{.*', '{...}', '')
     endfunction
     setl foldtext=FoldText()
   endfunction
   au FileType javascript call JavaScriptFold()
   au FileType javascript setl fen

   au FileType javascript imap <c-t> console.log();<esc>hi
   au FileType javascript imap <c-a> alert();<esc>hi
   au FileType javascript setl nocindent
   au FileType javascript inoremap <buffer> $r return

   au FileType javascript inoremap <buffer> $d //<cr>//<cr>//<esc>ka<space>
   au FileType javascript inoremap <buffer> $c /**<cr><space><cr>**/<esc>ka


   """"""""""""""""""""""""""""""
   " HTML
   """""""""""""""""""""""""""""""
   au FileType html,cheetah set ft=xml
   au FileType html,cheetah set syntax=html


   """"""""""""""""""""""""""""""
   " C mappings
   """""""""""""""""""""""""""""""
   autocmd FileType c map <buffer> <leader><space> :w<cr>:!gcc %<cr>


   """""""""""""""""""""""""""""""
   " SML
   """""""""""""""""""""""""""""""
   autocmd FileType sml map <silent> <buffer> <leader><space> <leader>cd:w<cr>:!sml %<cr>


   """"""""""""""""""""""""""""""
   " Scheme bidings
   """"""""""""""""""""""""""""""
   autocmd BufNewFile,BufRead *.scm map <buffer> <leader><space> <leader>cd:w<cr>:!petite %<cr>
   autocmd BufNewFile,BufRead *.scm inoremap <buffer> <C-t> (pretty-print )<esc>i
   autocmd BufNewFile,BufRead *.scm vnoremap <C-t> <esc>`>a)<esc>`<i(pretty-print <esc>


   """"""""""""""""""""""""""""""
   " SVN section
   """""""""""""""""""""""""""""""
   map <F8> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg


""""""""""""""""""""""""""""""
" Snippets
"""""""""""""""""""""""""""""""
   "You can use <c-j> to goto the next <++> - it is pretty smart ;)

   """""""""""""""""""""""""""""""
   " Python
   """""""""""""""""""""""""""""""
   autocmd FileType python inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("def <++>(<++>):\n<++>\nreturn <++>")<cr>
   autocmd FileType python inorea <buffer> cclass <c-r>=IMAP_PutTextWithMovement("class <++>:\n<++>")<cr>
   autocmd FileType python inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for <++> in <++>:\n<++>")<cr>
   autocmd FileType python inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>")<cr>
   autocmd FileType python inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>\nelse:\n<++>")<cr>


   """""""""""""""""""""""""""""""
   " JavaScript
   """""""""""""""""""""""""""""""
   autocmd FileType cheetah,html,javascript inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("function <++>(<++>) {\n<++>;\nreturn <++>;\n}")<cr>
   autocmd filetype cheetah,html,javascript inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for(<++>; <++>; <++>) {\n<++>;\n}")<cr>
   autocmd FileType cheetah,html,javascript inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}")<cr>
   autocmd FileType cheetah,html,javascript inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}\nelse {\n<++>;\n}")<cr>


   """""""""""""""""""""""""""""""
   " HTML
   """""""""""""""""""""""""""""""
   autocmd FileType cheetah,html inorea <buffer> cahref <c-r>=IMAP_PutTextWithMovement('<a href="<++>"><++></a>')<cr>
   autocmd FileType cheetah,html inorea <buffer> cbold <c-r>=IMAP_PutTextWithMovement('<b><++></b>')<cr>
   autocmd FileType cheetah,html inorea <buffer> cimg <c-r>=IMAP_PutTextWithMovement('<img src="<++>" alt="<++>" />')<cr>
   autocmd FileType cheetah,html inorea <buffer> cpara <c-r>=IMAP_PutTextWithMovement('<p><++></p>')<cr>
   autocmd FileType cheetah,html inorea <buffer> ctag <c-r>=IMAP_PutTextWithMovement('<<++>><++></<++>>')<cr>
   autocmd FileType cheetah,html inorea <buffer> ctag1 <c-r>=IMAP_PutTextWithMovement("<<++>><cr><++><cr></<++>>")<cr>


   """""""""""""""""""""""""""""""
   " Java
   """""""""""""""""""""""""""""""
   autocmd FileType java inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("public<++> <++>(<++>) {\n<++>;\nreturn <++>;\n}")<cr>
   autocmd FileType java inorea <buffer> cfunpr <c-r>=IMAP_PutTextWithMovement("private<++> <++>(<++>) {\n<++>;\nreturn <++>;\n}")<cr>
   autocmd FileType java inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for(<++>; <++>; <++>) {\n<++>;\n}")<cr>
   autocmd FileType java inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}")<cr>
   autocmd FileType java inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}\nelse {\n<++>;\n}")<cr>
   autocmd FileType java inorea <buffer> cclass <c-r>=IMAP_PutTextWithMovement("class <++> <++> {\n<++>\n}")<cr>
   autocmd FileType java inorea <buffer> cmain <c-r>=IMAP_PutTextWithMovement("public static void main(String[] argv) {\n<++>\n}")<cr>


   "Presse c-q insted of space (or other key) to complete the snippet
   imap <C-q> <C-]>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"For Cope
map <silent> <leader><cr> :noh<cr>

"Orginal for all
map <leader>n :cn<cr>
map <leader>p :cp<cr>
map <leader>c :botright cw 10<cr>
map <c-u> <c-l><c-j>:q<cr>:botright cw 10<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove the Windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

"Remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''

"Super paste
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

"A function that inserts links & anchors on a TOhtml export.
" Notice:
" Syntax used is:
" Link
" Anchor
function! SmartTOHtml()
   TOhtml
   try
    %s/&quot;\s\+\*&gt; \(.\+\)</" <a href="#\1" style="color: cyan">\1<\/a></g
    %s/&quot;\(-\|\s\)\+\*&gt; \(.\+\)</" \&nbsp;\&nbsp; <a href="#\2" style="color: cyan;">\2<\/a></g
    %s/&quot;\s\+=&gt; \(.\+\)</" <a name="\1" style="color: #fff">\1<\/a></g
   catch
   endtry
   exe ":write!"
   exe ":bd"
endfunction
