
# miniline.nvim

This is a minimalist statusline and tabline for neovim written primarily in lua.

## setup

Put this in `after/plugin/miniline.vim`:

```vim
function! GetStatusLine()
	return luaeval("require'statusline'.getline()")
endfunction

function! GetTabLine()
	return luaeval("require'tabline'.getline()")
endfunction

set noshowmode
set laststatus=2
set statusline=%!GetStatusLine()

set showtabline=2
set tabline=%!GetTabLine()
```

