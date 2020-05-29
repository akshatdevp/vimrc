" Vim with all enhancements

source $VIMRUNTIME/defaults.vim
"source $VIMRUNTIME/vimrc_example.vim
set number
set hidden
"set noundofile
"set noswapfile
"set noundofile
set directory=D:/temporaryvim//
set backupdir=D:/temporaryvim//
set undodir=D:/temporaryvim//
set autoindent
set wrap
set hlsearch
"let @c='i#include<bits/stdc++.h>
using namespace std;'
let @c='i#include<bits/stdc++.h>
using namespace std;
int main()
{
return 0;
{€kb€kb}€ku€ku
'
"syntax on
":autocmd BufWritePre * :normal gg=G
colorscheme darkblue
set guifont=Lucida_Sans_Typewriter:h11
nnoremap ; :
nnoremap <space><tab> :tabn<return>
nnoremap <F8> :tabe $MYVIMRC<return>
inoremap >> >><space>
inoremap jk <esc>
nnoremap <space><space> i<space><esc>
nnoremap <space><return> :tabe C:\Users\aksha\Desktop\cpptemplate.cpp<return>
autocmd BufNewFile  *.cpp :norm @c
autocmd BufNewFile  *.html :norm @h

augroup python_group
	autocmd!
	autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
	autocmd filetype python ia iff if:<esc>i
augroup END
augroup cpp_group
	autocmd!
	autocmd filetype cpp ia iff if()<esc>i
	autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ <C-r>% ' <CR>
augroup END

augroup java_group
	autocmd!
	autocmd filetype java ia iff if()<esc>i
	autocmd filetype java nnoremap <F4> :w <bar> exec '!javac <C-r>% ' <CR>
augroup end

augroup javascript_group
	autocmd!
	autocmd filetype javascript ia iff if()<esc>i
	autocmd filetype javascript ia fnn function()<esc>i
augroup end

"autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
"autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ <C-r>% ' <CR>
"autocmd filetype java nnoremap <F4> :w <bar> exec '!javac <C-r>% ' <CR>
autocmd filetype html nnoremap <F4> :w <bar> exec '!<C-r>%' <CR>
hi MatchParen ctermbg=red 
" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set backup		" keep a backup file (restore to previous version)
	if has('persistent_undo')
		set undofile	" keep an undo file (undo changes after closing)
	endif
endif

if &t_Co > 2 || has("gui_running")
	" Switch on highlighting the last used search pattern.
	set hlsearch
endif
if has('syntax') && has('eval')
	packadd! matchit
endif
if &diffopt !~# 'internal'
	set diffexpr=MyDiff()
endif
function MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg1 = substitute(arg1, '!', '\!', 'g')
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg2 = substitute(arg2, '!', '\!', 'g')
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	let arg3 = substitute(arg3, '!', '\!', 'g')
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			if empty(&shellxquote)
				let l:shxq_sav = ''
				set shellxquote&
			endif
			let cmd = '"' . $VIMRUNTIME . '\diff"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	let cmd = substitute(cmd, '!', '\!', 'g')
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
	if exists('l:shxq_sav')
		let &shellxquote=l:shxq_sav
	endif
endfunction

