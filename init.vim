
" Vim with all enhancements
source $VIMRUNTIME/defaults.vim
"source $VIMRUNTIME/vimrc_example.vim

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'altercation/vim-colors-solarized'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'aperezdc/vim-template'
Plug 'tpope/vim-repeat'
"Plug 'metakirby5/codi.vim'
call plug#end()

set number
set relativenumber
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
let @c='i#include<bits/stdc++.h>using namespace std;int main(){return 0;{€kb€kb}€ku€ku'
if has('gui_running')
	syntax enable
	set background=dark
	colorscheme solarized
	set guifont=Consolas:h11
	"syntax on
	":autocmd BufWritePre * :normal gg=G
else
	colorscheme elflord 
endif
set guifont=Lucida_Sans_Typewriter:h11
"mappings{{{
nnoremap <Up> :bn<return>
nnoremap <C-h> :bn<return>
nnoremap <C-l> :bp<return>
nnoremap <Down> :bp<return>
nnoremap ; :
nnoremap <space><tab> :tabn<return>
nnoremap <F8> :tabe $MYVIMRC<return>
nnoremap <F9> :tabe C:\Users\aksha\Desktop\useful\ commands\ and\ batch\ files\vim\ commands.txt<return>      
nnoremap <space><space> i<space><esc>
inoremap jk <esc>
inoremap <silent><expr> <c-k> coc#refresh()
inoremap <Up> <esc>:bn<return>
inoremap <Down> <esc>:bp<return>
"}}}
" autocmd BufNewFile  *.cpp :norm @c
:autocmd BufNewFile *.cpp 0r ~\.vim\templates\skeleton.cpp
"" Vimscript file settings ---------------- {{{

" the exclamation after the autocmd signifies that function should be
" overwritten
augroup python_group
	autocmd!
	autocmd filetype python  call SetPythonOptions()
	function SetPythonOptions()
		nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
		ia firr for i in range(n):<return>
	endfunction

augroup END
augroup cpp_group
	autocmd!
	autocmd filetype cpp call SetCPPoptions()
	function SetCPPoptions()
		ia iff if()<esc>i
		ia flrr for(ll i=0;i<n;i++)
		ia firr for(int i=0;i<n;i++)
		ia farr for(auto i:v)<esc>i
		ia vll  vector<long long>
		ia vii  vector<int>
		ia ll long long
		ia tcs long long t;cin>>t;while(t--){ }<esc>i
		nnoremap <F4> :w <bar> exec '!g++ <C-r>% ' <CR>
	endfunction

augroup END

augroup java_group
	autocmd!
	autocmd filetype java ia iff if()<esc>i
	autocmd filetype java ia sopp System.out.print()<esc>i
	autocmd filetype java ia sopl System.out.println()<esc>i

	autocmd filetype java nnoremap <F4> :w <bar> exec '!javac <C-r>% ' <CR>
augroup end

augroup javascript_group
	autocmd!
	autocmd filetype javascript ia iff if()<esc>i
	autocmd filetype javascript ia fnn function()<esc>i
augroup end
augroup vim_group
	autocmd!
	autocmd filetype vim setlocal foldmethod=marker
	autocmd filetype vim set foldlevel=0
augroup end
"""}}}
autocmd filetype html nnoremap <F4> :w <bar> exec '!<C-r>%' <CR>
hi MatchParen ctermbg=red 
"No clue what this does, came included with vim :p{{{
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
"}}}
