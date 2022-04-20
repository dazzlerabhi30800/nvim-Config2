:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set wrap
:set termguicolors
:set linespace=3
:set guicursor=i:block
:set linespace=5
:set showmatch
:set encoding=UTF-8
:set cmdheight=2
:set hls is
" :set smartindent
:set cursorline
"autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
" autocmd InsertLeave * highlight CursorLine guibg=#E76A08 guifg=fg
:set lsp=6
:set signcolumn=yes

" :set r rate 300 30

let g:polyglot_disabled = ['markdown']
let g:polyglot_disabled = ['markdown.plugin']
" let g:polyglot_disabled = ['autoindent']







call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'} " for file explorer
Plug 'https://github.com/morhetz/gruvbox'  "Gruvbox theme
Plug 'drewtempelmeyer/palenight.vim'
" Plug 'itchyny/lightline.vim' "light line theme
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin' "Nerd Tree

Plug 'kdheepak/lazygit.nvim' "git terminal

Plug 'https://github.com/christoomey/vim-tmux-navigator' "tmux navigator

Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight' "Nerd tree syntax highlight

Plug 'tpope/vim-commentary' "another commenter for comment toggler

Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/ryanoasis/vim-devicons' "devIcons

" Plug 'https://github.com/neoclide/coc.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'https://github.com/neoclide/coc-snippets'
" Plug 'https://github.com/neoclide/coc-prettier' "prettier extension

Plug 'https://github.com/mattn/emmet-vim' "emmet plugin

Plug 'https://github.com/norcalli/nvim-colorizer.lua' "Colorizer


" Plug 'https://github.com/preservim/nerdcommenter' "nerd commenter

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'ctrlpvim/ctrlp.vim' "file finder


" Language Syntax Support
Plug 'yuezk/vim-js'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql' "graphql syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'mxw/vim-jsx' "for jsx
Plug 'suy/vim-context-commentstring' "important for surround
Plug 'tpope/vim-surround' "for creating surround tags
Plug 'neoclide/vim-jsx-improve' "for improvment for jsx

"for SCSS
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'shmargum/vim-sass-colors'

" Plug 'https://github.com/AndrewRadev/tagalong.vim' "auto rename tag

"Plugin for tabs in neovim
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

set encoding=UTF-8

call plug#end()


"format on save
" autocmd BufWritePost * execute "normal gg=G"

" colorscheme gruvbox
colorscheme palenight
set background=dark
set termguicolors
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#777777'
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

"Setting up nerd Tree
inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
" vmap ++ <plug>NERDCommenterToggle
" nmap ++ <plug>NERDCommenterToggle
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"



" airline symbols
" let g:airline_theme='gruvbox'
" let g:lightline = {
			" \ 'colorscheme' : 'onedark'
			" \}
let g:airline_theme='tender'
" let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif


let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"modifying cursor line
" hi CursorLine gui=bold  ctermfg=black guibg=#A98773
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" set cursorline! cursorcolumn!


lua require'colorizer'.setup()

"Save the file using Ctrl + s
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a


"speeding up vim
:set timeoutlen=3000        " speed vim up
:set ttimeoutlen=100          " https://stackoverflow.com/questions/37644682/why-is-vim-so-slow/37645334
":set ttyfast                " Rendering
:set tw=2000
:set lazyredraw


" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
	return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
	if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
		NERDTreeFind
		wincmd p
	endif
endfunction


" if hidden is not set, TextEdit might fail.
:set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
:set updatetime=300

" don't give |ins-completion-menu| messages.
:set shortmess+=c

" always show signcolumns
:set signcolumn=yes

:set secure

"Setting the font
":set guifont=Iosevka:7
" :set guifont=Iosevka\ Fixed\ Extended:h7

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


"JS syntax highlighting
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1



" Splits and tabbed files
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>



" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K



" Removes pipes | that act as seperators on splits
set fillchars+=vert:\


"coc config
let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-pairs',
			\ 'coc-tsserver',
			\ 'coc-eslint', 
			\ 'coc-prettier', 
			\ 'coc-json', 
			\ ]
autocmd FileType css setl iskeyword+=-
"For scss file
autocmd FileType scss setl iskeyword+=@-@
"For html file

"Fixing the copy paste command
"set clipboard^=unnamed,unnamedplus
"inoremap <C-S-v> <Esc>"+p`]a
"set clipboard+=unnamedplus
"set clipboard=unnamedplus


command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


"configuring emmet
let g:user_emmet_leader_key=','


"Moving the line in upwared direction

" xnoremap K :move '<-2<CR>gv-gv
" xnoremap J :move '>+1<CR>gv-gv
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


"Setting colorscheme
let g:vim_jsx_pretty_colorful_config = 1 " default 0
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1

"Goyo settings

"Goyo Settings
function! s:goyo_enter()
	set noshowmode
	set noshowcmd
	set scrolloff=999
	Limelight
endfunction

function! s:goyo_leave()
	set showmode
	set showcmd
	set scrolloff=5
	Limelight!
	hi! Normal ctermbg=NONE guibg=NONE 
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()



"Lazy git settings
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

" setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>


"Auto rename tag settings
" The `<c-u>` removes the current visual mode, so a function can be called
xnoremap <buffer> p :<c-u>call <SID>Paste()<cr>

" The <SID> above is the same as the s: here
function! s:Paste()
	call tagalong#Trigger()

	" gv reselects the previously-selected area, and then we just paste
	normal! gvp

	call tagalong#Apply()
endfunction

inoremap <silent> <c-c> <c-c>:call tagalong#Apply()<cr>
let g:tagalong_filetypes = ['eco', 'eelixir', 'ejs', 'eruby', 'html', 'htmldjango', 'javascriptreact', 'jsx', 'php', 'typescriptreact', 'xml']
let g:tagalong_excluded_filetype_combinations = ['custom.html']
let g:tagalong_verbose = 1


"Setting for tpope commenter
autocmd FileType apache setlocal commentstring=#\ %s
autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
autocmd FileType javascript.jsx setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftdetect file
"
" Language: JSX (JavaScript)
" Maintainer: Max Wang <mxawng@gmail.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Whether the .jsx extension is required.
if !exists('g:jsx_ext_required')
	let g:jsx_ext_required = 1
endif

" Whether the @jsx pragma is required.
if !exists('g:jsx_pragma_required')
	let g:jsx_pragma_required = 0
endif

let s:jsx_pragma_pattern = '\%^\_s*\/\*\*\%(\_.\%(\*\/\)\@!\)*@jsx\_.\{-}\*\/'

" Whether to set the JSX filetype on *.js files.
fu! <SID>EnableJSX()
	if g:jsx_pragma_required && !exists('b:jsx_ext_found')
		" Look for the @jsx pragma.  It must be included in a docblock comment
		" before anything else in the file (except whitespace).
		let b:jsx_pragma_found = search(s:jsx_pragma_pattern, 'npw')
	endif

	if g:jsx_pragma_required && !b:jsx_pragma_found | return 0 | endif
	if g:jsx_ext_required && !exists('b:jsx_ext_found') | return 0 | endif
	return 1
endfu

autocmd BufNewFile,BufRead *.jsx let b:jsx_ext_found = 1
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.js if <SID>EnableJSX() | set filetype=javascript.jsx | endif
if exists('g:context#commentstring#table')
	let g:context#commentstring#table['javascript.jsx'] = {
				\ 'jsComment' : '// %s',
				\ 'jsImport' : '// %s',
				\ 'jsxStatment' : '// %s',
				\ 'jsxRegion' : '{/*%s*/}',
				\}
endif

autocmd! BufRead,BufNewFile *.{jsx,jx,js} setlocal filetype=javascript.jsx

"compiler for python file
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


"file buffer settings
"Starting directory CtrlP
let g:ctrlp_working_path_mode = 'ra'

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/bundle/*,*/node_modules/

"for SASS
" vim:set sw=2:

"Settings for Tabs in neovim
:set mouse+=a
"mapping settings for tabs in neovim
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
" nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used



"Vim Script

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
" inoremap {<Enter> {<Enter>}<Esc>O

"Neoformate Plugin settings

"Disable Error detection
let b:coc_diagnostic_disable=1


set nocompatible
set runtimepath^=/path/to/coc.nvim
filetype plugin indent on
syntax on
set hidden 


"Settings for tender Theme
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
let macvim_skip_colorscheme=1
"making background Transparent
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
highlight Normal guibg=none
highlight NonText guibg=none


"Settings for chadTree
nnoremap <leader>v <cmd>CHADopen<cr>
nnoremap <leader>l <cmd>call setqflist([])<cr>




