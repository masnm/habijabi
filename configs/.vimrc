" enter the current millenium
set nocompatible

" enable search highliting
set hlsearch
set incsearch

" enable line number and indentation
set number
set relativenumber

" smart indenting and tabbing for new lines
set smartindent
set smarttab

" show command and insert mode
set showmode

" sntax and indent and stuff
syntax enable
filetype plugin on
filetype plugin indent on
set autoindent expandtab tabstop=4 shiftwidth=4

" enable spell checking
setlocal spell spelllang=en_us

" search down into subfolders
" Provides tab-completaion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Create the `tags` file
" set tags+=/usr/include/tags
command! MakeTags !ctags -R .

" automatically write files when changing when multiple files open
set autowrite

" FILE BROWING
let g:netrw_banner    = 0
let g:netrw_chgwin    = 2
let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 20
let g:netrw_list_hide = netrw_gitignore#Hide() .. '.*\.swp$'
"autocmd VimEnter * 20Lexplore

"Tweaks for browsing
"let g:netrw_browee_split=4	"open in prior window
"let g:netrw_altv=1          "open splits to the right
"let g:netrw_liststyle=3     "tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s)\zs\.\s\+'
" - cheak |netrw-browse-maps|

" setting the leader key
let mapleader = ","

" function to call cmake on current directory into Build folder
function! CmakeBuildGenerate ()
    !command cmake -B Build -S .
endfunction
function! CmakeBuild ()
    !command cmake --build Build
endfunction
nnoremap ,cb :call CmakeBuildGenerate ()<CR>
nnoremap ,cm :call CmakeBuild ()<CR>

"snipits : if needed cheak net or watch video
nnoremap ,cc :-1read $HOME/codes/habijabi/Snippets/main.c<CR>7ggo<CR>
nnoremap ,cpp :-1read $HOME/codes/habijabi/Snippets/main.cpp<CR>45ggzt
nnoremap ,java :-1read $HOME/codes/habijabi/Snippets/main.java<CR>8ggf{hi
nnoremap ,html :-1read $HOME/codes/habijabi/Snippets/main.html<CR>6ggwww
nnoremap ,dt :r!date<CR>kdd

" making tab visible
set listchars=tab:·\ ,trail:~,
set list

" colorscheme my favourite one
colorscheme xoria256

" setting the 'makeprg' variable
if !empty(glob("./Build/Makefile"))
	set makeprg=cmake\ --build\ Build
elseif empty(glob("./Makefile"))
	set makeprg=my_code_compile_cmnd.sh\ %
endif

" Test command inside vim
command! Test !my_verdict_cmnd.sh %

" Run command inside vim
command! Run !Build/Test3D
" command! Run !my_code_runner_cmnd.sh %

" Cheak time and memory usage
command! TM !my_time_memory_usage_cmnd.sh %

" Copy file to clipboard for submitting
command! Sub !my_input_submit_cmnd.sh %

" Check for accepted or wrong and
command! Ver !my_accepted_wrong_ans_cmnd.sh %

" remapping arrow keys
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" enabling maximum columnwidth and enabling error
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

" wrap text on specific column
" set textwidth=80
" set wrapmargin=2

" vim clang format integration
function! Formatonsave()
  let l:lines="all"
"  let l:formatdiff = 1
  py3file /usr/share/clang/clang-format.py
"  py3f /usr/bin/clang-format
endfunction
autocmd BufWritePre *.h,*.cc,*.c,*.cpp,*.hpp call Formatonsave()

" map <C-I> :py3f /usr/share/clang/clang-format.py<cr>
" imap <C-I> <c-o>:py3f /usr/share/clang/clang-format.py<cr>
