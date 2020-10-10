
function GetStatusLine()
	return luaeval("require'statusline'.getline()")
endfunction

function GetTabLine()
	return luaeval("require'tabline'.getline()")
endfunction

set noshowmode
set laststatus=2
set statusline=%!GetStatusLine()

set showtabline=2
set tabline=%!GetTabLine()

