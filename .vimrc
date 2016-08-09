"ctags config
set tags=./tags;,~/.vim/tags/includefiles,~/.vim/tags/linuxsource441
"unmap <C-J>
"unmap <C-L>
"unmap <C-R>

map <C-J> :tag <C-R>=expand("<cword>")<CR><CR> "Jump
map <C-L> :tselect <C-R>=expand("<cword>")<CR><CR> "List
map <C-R> :pop <CR> "Return

"cycle through matching tags -
"unmap <MiddleMouse> 
"unmap <C-MiddleMouse> 

map <C-Right> :tnext <CR>
map <C-Left> :tNext <CR>

"cscope config
function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose
	endif
endfunction
set cscoperelative cscopeverbose
"unmap <C-C>
map <C-C> :call LoadCscope() <CR>
