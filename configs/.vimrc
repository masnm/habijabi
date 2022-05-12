" enter the current millenium
set nocompatible

" all 256 bit colors
set termguicolors

" enable folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" enable line number and indentation
set number
set relativenumber
filetype plugin indent on
set tabstop=4
set shiftwidth=4

" enable syntax and plugin (for netrw)
syntax enable
filetype plugin on

" enable dictionary
set dictionary+=/usr/share/dict/american-english

" search down into subfolders
" Provides tab-completaion for all file-related tasks
set path+=**
autocmd FileType cpp set path+=/usr/include/c++/11/

" Display all matching files when we tab complete
set wildmenu

" Create the `tags` file
set tags+=/usr/include/tags
command! MakeTags !ctags -R .

"FILE BROWING
"Tweaks for browsing
let g:netrw_banner=0		"disable annoying banner
let g:netrw_browee_split=4	"open in prior window
let g:netrw_altv=1		"open splits to the right
let g:netrw_liststyle=3		"tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s)\zs\.\s\+'
" - cheak |netrw-browse-maps|

"snipits : if needed cheak net or watch video
nnoremap ,cc :-1read $HOME/codes/habijabi/Snippets/main.c<CR>4ggo<CR>
nnoremap ,cpp :-1read $HOME/codes/habijabi/Snippets/main.cpp<CR>38ggzt
nnoremap ,java :-1read $HOME/codes/habijabi/Snippets/main.java<CR>8ggf{hi
nnoremap ,rs mmG?using<CR>j:-1read $HOME/codes/habijabi/Snippets/read_string.cpp<CR>2jf[a

" scan test cases
nnoremap ,ntc mmG9ki//<ESC>`m
nnoremap ,ytc mmG9kvld<ESC>`m

" print case number
nnoremap ,ncn mmG7ki//<ESC>`m
nnoremap ,ycn mmG7kvld<ESC>`m

" making tab visible
set listchars=tab:·\ ,
set list

" Call plug#begin()
" 	Plug 'octol/vim-cpp-enhanced-highlight'
" Call plug#end()

set notermguicolors
" colorscheme elflord
colorscheme xoria256

" setting the 'makeprg' variable
set makeprg=my_code_compile_cmnd.sh\ %

" Test command inside vim
command! Test !my_verdict_cmnd.sh %

" Run command inside vim
command! Run !my_code_runner_cmnd.sh %

" Cheak time and memory usage
command! TM !my_time_memory_usage_cmnd.sh %

" Copy file to clipboard for submitting
command! Sub !my_input_submit_cmnd.sh %

" remapping arrow keys
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" enabling maximum columnwidth and enabling error
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)
