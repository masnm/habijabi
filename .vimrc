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
filetype plugin indent on

" enable syntax and plugin (for netrw)
syntax enable
filetype plugin on

" search down into subfolders
" Provides tab-completaion for all file-related tasks
" set path+=**
autocmd FileType cpp set path+=/usr/include/c++/11/

" Display all matching files when we tab complete
set wildmenu

" Create the `tags` file
" command! MakeTags !ctags -R .

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

" scan test cases
nnoremap ,ntc G9ki//<ESC>?solve<CR>
nnoremap ,ytc G9kvld<ESC>?solve<CR>

" print case number
nnoremap ,ncn G7ki//<ESC>?solve<CR>
nnoremap ,ycn G7kvld<ESC>?solve<CR>

" read string function
nnoremap ,rs ?using<CR>j:-1read $HOME/codes/habijabi/Snippets/read_string.cpp<CR>2jf[a

" making tab visible
set listchars=tab:·\ ,
set list

