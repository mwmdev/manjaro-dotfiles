"{{{ General settings

" Disable vi compatibility
set nocompatible

" Disable filetype (reenabled later)
filetype off

" Keep 100 lines of command line history
set history=100

" Encoding
set encoding=utf-8

" Auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Set vim working directory to currenty opened file
set autochdir

" Redraw the screen only when necessary
set lazyredraw

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on

" Automatically delete tralling whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Set backup directory
set backupdir=~/tmp

"}}}

"{{{ Plugins

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin manager
" https://github.com/VundleVim/Vundle.vim
Plugin 'VundleVim/Vundle.vim'

" Color scheme
" https://github.com/morhetz/gruvbox/
Plugin 'morhetz/gruvbox'

" Start page
" https://github.com/mhinz/vim-startify
Plugin 'mhinz/vim-startify'

" Smooth scrolling
" https://github.com/psliwka/vim-smoothie
Plugin 'psliwka/vim-smoothie'

" Status line
" https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" Fuzzy finder
" https://github.com/junegunn
" https://github.com/junegunn/fzf.vim
" https://github.com/junegunn/fzf/wiki/examples
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in
"  the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --line-number --no-heading --fixed-strings --ignore-case --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Snippets manager
" https://github.com/sirver/UltiSnips
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir='~/.vim/mysnippets'
let g:UltiSnipsSnippetDirectories=["mysnippets"]

" File browser
" https://github.com/vifm/vifm.vim
Plugin 'vifm/vifm.vim'

" Marks management
" https://github.com/kshenoy/vim-signature
Plugin 'kshenoy/vim-signature'

" CSS Color preview
" https://github.com/ap/vim-css-color.git
Plugin 'ap/vim-css-color'

" Distraction free editing
" https://github.com/junegunn/goyo.vim
Plugin 'junegunn/goyo.vim'
autocmd vimenter *.md Goyo

" Commenting / Uncommenting blocks
" https://github.com/tomtom/tcomment_vim
Plugin 'tomtom/tcomment_vim'

" Easy viewing of registers
" https://github.com/junegunn/vim-peekaboo
Plugin 'junegunn/vim-peekaboo'

" Documentation browsing
" https://github.com/KabbAmine/zeavim.vim
Plugin 'KabbAmine/zeavim.vim'
let g:zv_file_types = {
      \   'scss': 'css,sass',
      \   'php'  : 'php,wordpress,html',
      \   'js'  : 'javascript,jquery',
      \   'html'  : 'html,css',
      \   'lua'  : 'lua',
      \   'py'  : 'python',
      \ }

" Git wrapper
" https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'

" Git history viewer
" https://github.com/rbong/vim-flog
Plugin 'rbong/vim-flog'

" Git gutter
" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'

" Wiki
" https://github.com/vimwiki/vimwiki
Plugin 'vimwiki/vimwiki'
let g:vimwiki_global_ext = 0
let g:vimwiki_folding='expr'
let g:vimwiki_key_mappings = { 'table_mappings': 0, }
let g:vimwiki_list = [{
    \ 'path': '~/vimwiki/',
    \ 'syntax': 'markdown',
    \ 'ext': '.md'}]

" Better indent for PHP with HTML
" https://github.com/captbaritone/better-indent-support-for-php-with-html
Plugin 'captbaritone/better-indent-support-for-php-with-html'

" Vim indent guides
" https://github.com/nathanaelkane/vim-indent-guides
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey ctermbg=239
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey ctermbg=237

call vundle#end()

" }}}

"{{{ Look and feel

" Show line numbers
set number

" Show relative line numbers
" set relativenumber

" Highlight the current line
set cursorline

" Show syntac highlighting
syntax on

" Color scheme
set background=dark
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

" Add a bit extra margin to the left
set foldcolumn=0

" Set line height
set linespace=8

" Auto indentation
set autoindent

" Insert spaces when pressing tab
set expandtab


" Number of visual spaces per tab
set tabstop=2

" Number of spaces to use for each step of (auto)indent
set shiftwidth=2

" Number of spaces inserted when tab is pressed in insert mode
set softtabstop=2

" Disabls automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Make tabs and trailing spaces visible when requested
set listchars=tab:←→,trail:·,eol:↓

" Hides tabs
set tabline=0

" set indentation for python files
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab

"}}}

"{{{ Searching

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Enable autocompletion
set wildmode=longest,list,full
set wildmenu

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search matches
set hlsearch

" Search as characters are entered (incremental search)
set incsearch

" }}}

"{{{ Navigation

" Open splits on the bottom and right
set splitbelow
set splitright

" Folding
set foldenable
set foldlevel=0
set foldnestmax=10
set foldmethod=marker
set modelines=1

"}}}

"{{{ Functions

"{{{ RipgrepFzf
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --line-number --color=always --smart-case -g "*.{htm,html,scss,css,js,php}" -- %s ~/Localserver || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind','change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec),a:fullscreen)
endfunction
"}}}

"}}}

"{{{ Keymaps

" Set the mapleader key
let mapleader = ","

" Move to the next sentence with tab
nnoremap <TAB> )

" Open the help file in a split
nnoremap <leader>h :vsplit ~/help<cr>

" Open a terminal
nnoremap <leader>t :term<CR>

" Toggle Vifm
nnoremap <leader>o :Vifm<CR>

" Open vim-signature marks pane
nnoremap <leader>m :Marks<CR>

" Do a diff of the opened files
nnoremap <leader>d :windo diffthis<CR><c-w>h

" Close the diff
nnoremap <leader>dd :diffof<CR>

" Edit snippets for current file type
nnoremap <leader>es :UltiSnipsEdit<CR>

" Git status
nnoremap <leader>gs :Git<CR>

" Git diff
nnoremap <leader>gd :Gdiff<CR>

" Git add current file
nnoremap <leader>ga :Gwrite %<CR>

" Git commit
nnoremap <leader>gc :Git commit<CR>

" Git push
nnoremap <leader>gp :Git push<CR>

" Git commit history
nnoremap <leader>gh :Flogsplit<CR>

" Toggle distraction free editing
nnoremap <leader>df :Goyo<CR>

" Fuzzy find in local projects
nnoremap <leader>f :FZF ~/Localserver/<CR>

" Ripgrep
nnoremap <leader>r :Find<SPACE>

" List TODO marks
nnoremap <leader>n :RG<SPACE>@@TODO<CR>

" Summon copilot
nnoremap <leader>c :Copilot panel<CR>

" Center cursor vertically
nnoremap <leader>cc :set so=999<CR>

" List buffers
nnoremap <leader>b :Buffers<CR>

" Yank the complete file
nnoremap <leader>ya gg0vG$y

" Exit insert mode
inoremap jk <esc>

" Toggle 80 chars column
nnoremap <leader>co :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>

" New horizontal split
nnoremap <c-h> :sp<CR>

" New vertical split
nnoremap <c-v> :vsp<CR>

" Switch splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize current buffer by +/- 5
nnoremap <c-left> :vertical resize -5<cr>
nnoremap <c-down> :resize +5<cr>
nnoremap <c-up> :resize -5<cr>
nnoremap <c-right> :vertical resize +5<cr>

" New tab
nnoremap <C-t> :tabnew<cr>

" Turn off search result highlighting
nnoremap <space><space> :noh<cr>

" Switch to light theme
nnoremap <leader>lt :set background=light<cr>

" Switch to dark theme
nnoremap <leader>dt :set background=dark<cr>

" Toggle indent guides
nnoremap <leader>ig :IndentGuidesToggle<cr>

"}}}

"{{{ Abbreviations
abb _@ mike@mwm-webdesign.com
abb _mw Michael Wassmer
abb _lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
"}}}

" Testing
" set runtimepath+=~/.config/nvim/plugin/vim-logstack

" Forgot why this is here
filetype off
if has("autocmd")
  filetype plugin indent on
endif

" Format closed folds line
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')

" vim:foldmethod=marker:foldlevel=0
