if v:progname =~? "evim"
    finish
endif

set ignorecase
set wildmode=longest,list,full

"set smartindent
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let g:mapleader = ";"
"let g:maplocalleader = "\\"
let g:maplocalleader = ";"


"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set shell=/bin/bash
Plugin 'VundleVim/Vundle.vim'
Plugin 'JuliaLang/julia-vim' "julia syntax support
Plugin 'kdheepak/JuliaFormatter.vim' "Formatting Julia Files
Plugin 'AtsushiSakai/julia.vim' "automatic docstring generation
Plugin 'tmhedberg/SimpylFold' " python 
Plugin 'vim-scripts/indentpython.vim' "python
Plugin 'kien/ctrlp.vim' "ctrl-p
Plugin 'sjl/gundo.vim'
Plugin 'preservim/nerdtree' "menu ide
Plugin 'tpope/vim-fugitive' "git wrapper
Plugin 'vim-airline/vim-airline' "status line
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/Vim-R-plugin' "R support
Plugin 'epeli/slimux' "slime and tmux, commands: ctrl-x+ctrl-x, ctrl-x+b,ctrl-x+v
Plugin 'jpalardy/vim-slime' "slime and tmux, commands: ctrl-c+ctrl-j
Plugin 'godlygeek/tabular' "align objects :Tabularize/<separator>
Plugin 'dhruvasagar/vim-table-mode' "auto table alignment similar to tabular
Plugin 'christoomey/vim-tmux-navigator' "seamless tmux/vim moves between panes
Plugin 'tomtom/tcomment_vim' "toggle comments 
Plugin 'easymotion/vim-easymotion' "move to texts, command: ;;w
"Plugin 'airblade/vim-gitgutter' "show changes to files
Plugin 'frazrepo/vim-rainbow' "colorize enclosures
Plugin 'terryma/vim-multiple-cursors' " ctrl-n
"Plugin 'nathanaelkane/vim-indent-guides' "shows blocks of indent spaces
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-surround'
" Automatic Window Resizing
Plugin 'camspiers/lens.vim'
" Command line fuzzy finder
Plugin 'junegunn/fzf', { 'do': './install --bin' } "Checks latest fzf binary
Plugin 'junegunn/fzf.vim'
" Easy commenting for Vim
Plugin 'preservim/nerdcommenter'
" Distraction-free writing in Vim
Plugin 'junegunn/goyo.vim'
" Rethinking Vim as a tool for writing
Plugin 'reedes/vim-pencil'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8' "python syntac and style checker
"Plugin 'ycm-core/YouCompleteMe' 
Plugin 'puremourning/vimspector'
"Plugin 'elzr/vim-json'
"Plugin 'prabirshrestha/vim-lsp'
"Plugin 'mattn/vim-lsp-settings'
"Plugin 'prabirshrestha/asyncomplete.vim'
"Plugin 'prabirshrestha/asyncomplete-lsp.vim'
"Plugin 'machakann/vim-lsp-julia'
" Formatting of HTML, JS, CSS, JSON, and JSX Files
"Plugin 'maksimr/vim-jsbeautify'
" Adding support for LaTeX
"Plugin 'lervag/vimtex'
" Live Previewing of LaTeX Documents
"Plugin 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" BibTeX Handling
"Plugin 'vim-pandoc/vim-pandoc'
"Plugin 'vim-pandoc/vim-pandoc-syntax' "Also used for Markdown formatting
" Tab naming powers
"Plugin 'gcmt/taboo.vim'
Plugin 'sjl/badwolf' "A color scheme for Vim
Plugin 'stephpy/vim-yaml'
"Plugin 'lervag/vimtex'
"Plugin 'chrisbra/csv.vim'
"Plugin 'jalvesaq/R-Vim-runtime'
"Plugin 'mattn/calendar-vim'
"Plugin 'itchyny/calendar.vim'
"Plugin 'jceb/vim-orgmode' "todo organizer
"Plugin 'tpope/vim-speeddating' "process dates
"Plugin 'sheerun/vim-polyglot'
"Plugin 'tpope/vim-sleuth'
"Plugin 'zah/nim.vim'
"Plugin 'keith/swift.vim'
"Plugin 'rust-lang/rust.vim'
"Plugin 'plasticboy/vim-markdown' "fold enabled
" ExpandingMan plugin recommendation
Plugin 'dracula/vim'
Plugin 'liuchengxu/vim-which-key' " gives us lists of key bindings
Plugin 'Th3Whit3Wolf/onebuddy', { 'branch': 'main' }
"Plugin 'Yggdroot/indentLine'
call vundle#end()   

" youcompletme
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/global_extra_conf.py'


" yaml
let g:yaml_limit_spell=1

"set termguicolors
"colorscheme pablo
colorscheme badwolf
" folding lsp
set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
" disable folding
"let g:lsp_fold_enabled = 0

" completion
set completeopt=menuone,noinsert,noselect
set shortmess+=c


"fugitive.vim
nnoremap <C-g>c :Gcommit
nnoremap <C-g>a :Gwrite
nnoremap <C-g>s :Gstatus

" vimspector human mode
let g:vimspector_enable_mappings = 'HUMAN'

" vim-lsp-julia
" :LspInstallServer to install julia lsp server
"let g:lsp_julia_path = "/Applications/Julia-1.6.app/Contents/Resources/julia/bin/julia"
"let g:lsp_diagnostics_enabled = 0
"highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

"--------------
map <F6> :setlocal spell! spelllang=en_gb<CR>
set encoding=utf-8

"""""""""""""""""""""
"JULIA FORMATTER
"""""""""""""""""""""

let g:JuliaFormatter_options = {
        \ 'indent'                    : 3,
        \ 'margin'                    : 92,
        \ 'always_for_in'             : v:false,
        \ 'whitespace_typedefs'       : v:false,
        \ 'whitespace_ops_in_indices' : v:true,
        \ }

" normal mode mapping
nnoremap <leader>jf :JuliaFormatterFormat<CR>
" visual mode mapping
vnoremap <leader>jf :JuliaFormatterFormat<CR>

"--------------



"""""""""""""""""
"MARKDOWN-PREVIEW
"""""""""""""""""

" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

let g:mkdp_browser = 'vivaldi'

""""""""""""""""""""""""""""""
" VIM-JSBEAUTIFY
""""""""""""""""""""""""""""""
".vimrc
"map <c-f> :call JsBeautify()<cr>
" or
"autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
"autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
"autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
"autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
"autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

""""""""""""""""""""""""""""""
" VIMPENCIL
""""""""""""""""""""""""""""""

" Automatically enable Pencil for files
augroup pencil
  autocmd!
  autocmd FileType py call pencil#init({'wrap' : 'soft'})
  autocmd FileType markdown call pencil#init({'wrap' : 'soft'})
  autocmd FileType julia call pencil#init({'wrap' : 'soft'})
  autocmd FileType tex call pencil#init({'wrap' : 'soft'})
augroup END

""""""""""""""""""""""""""""""
" TABULAR & VIM-MARKDOWN
""""""""""""""""""""""""""""""

let g:vim_markdown_folding_level = 1

""""""""""""""""""""""""""""""
" VIM-PANDOC
""""""""""""""""""""""""""""""
let g:pandoc#filetypes#handled = ['pandoc', 'markdown']
let g:pandoc#modules#disabled = ['spell']
let g:pandoc#folding#fold_fenced_codeblocks = 1
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#biblio#bibs = ['/home/src/Knowledgebase/Zettelkasten/zettel.bib']
let g:pandoc#toc#close_after_navigating = 0
let g:pandoc#toc#position = 'bottom'
let g:pandoc#folding#fdc = 0

""""""""""""""""""""""""""""""
" FZF-VIM
""""""""""""""""""""""""""""""

let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

""""""""""""""""""""""""""""""
" VIM-TEX
""""""""""""""""""""""""""""""

let g:tex_flavor='latexmk'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_quickfix_mode=0
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
           \ 'preamble' : {'enabled' : 1},
           \ 'sections' : {'enabled' : 0},
           \ 'envs' : {
           \   'blacklist' : ['figures'],
           \ },
           \}

""""""""""""""""""""""""""""""
" VIM-LATEX-LIVE-PREVIEW
""""""""""""""""""""""""""""""
let g:livepreview_previewer = 'zathura'
let g:livepreview_use_biber = 1

""""""""""""""""""""""""""""""
" VIM-TABLE-MODE
""""""""""""""""""""""""""""""

let g:table_mode_corner = "|"
let g:table_mode_align_char = ":"



"deoplete
let g:deoplete#enable_at_startup = 1

"rainbow
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.jl' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 0

"gitgutter
set updatetime=100 "update for gitgutter

" vimtex
let g:vimtex_view_general_viewer = 'open'
let g:vimtex_view_general_options = '-a Skim'
let g:vimtex_view_method = 'skim'

" gundo.vim
set undodir=~/.vim/tmp1/undo//
set backupdir=~/.vim/tmp1/backup//
set directory=~/.vim/tmp1/swap//
set backupskip=/tmp/*,/private/tmp/*
set backup
set writebackup
set noswapfile
set undofile
set history=100
set undolevels=100
nnoremap <F5> :GundoToggle<CR>
let g:gundo_prefer_python3 = 1

filetype plugin indent on 

let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=3
let vim_markdown_preview_hotkey='<C-/>'
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_temp_file=1

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on
    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!
        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78
        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif
    augroup END
else
    set autoindent		" always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

autocmd Filetype    python
                \   setlocal ts=4 |
                \   setlocal expandtab |
                \   setlocal sw=4 |
                \   setlocal ai
                
set expandtab ts=3 sw=3 ai
set cindent
set infercase
set hlsearch
set incsearch
set nowrap

filetype plugin indent on
filetype indent on
filetype plugin on

setlocal autoindent
setlocal indentkeys+==end,=else,=catch,=finally
setlocal indentkeys-=0#
setlocal indentkeys-=:
setlocal indentkeys-=0{
setlocal indentkeys-=0}
setlocal nosmartindent

"----------------------------------------------------------------------
" Lines added by the Vim-R-plugin command :RpluginConfig (2014-Mar-20 11:34):
" Change Leader and LocalLeader keys:
"let maplocalleader = "\"
"let mapleader = ";"
"" Use Ctrl+Space to do omnicompletion:
"if has("gui_running")
"    inoremap <C-Space> <C-x><C-o>
"else
"    inoremap <Nul> <C-x><C-o>
"endif

" Disable autocomment 
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" slime target for TMUX
let g:slime_target = "tmux"
let g:slime_dont_ask_default = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "{down-of}"}
let g:slime_python_ipython = 1
let g:slime_paste_file = "/Users/ppalmes/.slime_paste"

" jump to nonempty line
nnoremap } :<C-u>call search('^$')<cr> 
"nnoremap { :<C-u>call search('^$', 'b')<cr>

xmap   <c-c><c-c>   <Plug>SlimeRegionSend
nmap   <c-c><c-c>   <Plug>SlimeParagraphSend
xmap   <leader>a    <Plug>SlimeRegionSend
nmap   <leader>a    <Plug>SlimeParagraphSend
map    <leader>s    :SlimeSendCurrentLine<CR>
map    <leader>b    :%SlimeSend<CR>
nmap   <c-c>v       <Plug>SlimeConfig
nmap   <leader>l    :SlimeSend0  "<c-l>"<CR>

" https://github.com/jpalardy/vim-slime/wiki/configurations
xmap <silent> <c-c><c-h> :exec 'let g:slime_default_config.target_pane = "{left-of}"'<cr><Plug>SlimeRegionSend
xmap <silent> <c-c><c-j> :exec 'let g:slime_default_config.target_pane = "{down-of}"'<cr><Plug>SlimeRegionSend
xmap <silent> <c-c><c-k> :exec 'let g:slime_default_config.target_pane = "{up-of}"'<cr><Plug>SlimeRegionSend
xmap <silent> <c-c><c-l> :exec 'let g:slime_default_config.target_pane = "{right-of}"'<cr><Plug>SlimeRegionSend
nmap <silent> <c-c><c-h> :exec 'let g:slime_default_config.target_pane = "{left-of}"'<cr><Plug>SlimeParagraphSend
nmap <silent> <c-c><c-j> :exec 'let g:slime_default_config.target_pane = "{down-of}"'<cr><Plug>SlimeParagraphSend
nmap <silent> <c-c><c-k> :exec 'let g:slime_default_config.target_pane = "{up-of}"'<cr><Plug>SlimeParagraphSend
nmap <silent> <c-c><c-l> :exec 'let g:slime_default_config.target_pane = "{right-of}"'<cr><Plug>SlimeParagraphSend

" slimux
map <C-x><C-x>  :SlimuxREPLSendLine<CR>
vmap <C-x><C-x> :SlimuxREPLSendSelection<CR>
vmap <leader>l  :SlimuxREPLSendSelection<CR>
map <C-x>b      :SlimuxREPLSendBuffer<CR>
map <C-x>a      :SlimuxShellLast<CR>
map <C-x>k      :SlimuxSendKeysLast<CR>
map <C-x>v      :SlimuxREPLConfigure<CR>
let g:slimux_select_from_current_window = 1 


" syntastic
let g:syntastic_ignore_files = ['\.java$']
let g:syntastic_ignore_files = ['\.scala$']
let g:syntastic_ignore_files = ['\.py$']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

" re-indent entire file
map <C-i>  mzgg=G`z
map <C-l>  mzggvG
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

if &shell =~# 'fish$'
    set shell=sh
endif

"" vim-latex
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'
"let g:latex_to_unicode_file_types=".*"
"let g:latex_to_unicode_auto = 1
"set nofoldenable

"" for nim support
"fun! JumpToDef()
"  if exists("*GotoDefinition_" . &filetype)
"    call GotoDefinition_{&filetype}()
"  else
"    exe "norm! \<C-]>"
"  endif
"endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i
let g:netrw_banner = 0
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

"nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-t> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"tabular
nmap <leader>t= :Tabularize /=<CR>
vmap <leader>t= :Tabularize /=<CR>
nmap <leader>t: :Tabularize /:\zs<CR>
vmap <leader>t: :Tabularize /:\zs<CR>
nmap <leader>t, :Tabularize /,<CR>
vmap <leader>t, :Tabularize /,<CR>

"vim-table-mode for csv. default is to process cucumber table
"let g:table_mode_border=0
"let g:table_mode_separator=','
"let g:separator_map=','

"tmux-navigator
noremap <silent> <m-h> :TmuxNavigateLeft<cr>
noremap <silent> <m-j> :TmuxNavigateDown<cr>
noremap <silent> <m-k> :TmuxNavigateUp<cr>
noremap <silent> <m-l> :TmuxNavigateRight<cr>

" Enable folding
"set nofoldenable
set foldmethod=syntax
""set foldmethod=indent
set foldnestmax=10
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> zc


"" --- python ---
"python3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF
let python_highlight_all=1
syntax on

" highlight rows
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline!<CR>
" clear highlight search
nnoremap <silent> <Space> :noh<CR><Space>
" Ctrl+e to move to end of word
inoremap <C-e> <Esc>ea 
"Ctrl+b to move to beginning of word
inoremap <C-b> <C-o>b
"Ctrl+a to move to end of line
inoremap <C-a> <C-o>A
"Ctrl+s to move to start of line
inoremap <C-s> <C-o>I 

set rtp+=/opt/homebrew/opt/fzf
