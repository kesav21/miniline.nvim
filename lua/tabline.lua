
local M = {}

vim.api.nvim_command("hi TabSel    guifg=#1d2021 guibg=#a89984")
vim.api.nvim_command("hi TabUnsel  guifg=#a89984 guibg=#282828")
vim.api.nvim_command("hi TabClear                guibg=#282828")

function gethighlight(tab, current)
	if tab == current then return "%#TabSel#"
	else return "%#TabUnsel#"
	end
end

function getname(tab)
	local win = vim.api.nvim_tabpage_get_win(tab)
	local buf = vim.api.nvim_win_get_buf(win)
	local fullname = vim.api.nvim_buf_get_name(buf)
	local name = vim.fn.fnamemodify(fullname, ":.")
	return vim.fn.pathshorten(name)
end

function M.getline()
	local tabs = vim.api.nvim_list_tabpages()
	local current = vim.api.nvim_get_current_tabpage()

	local line = ""
	for _, tab in ipairs(tabs) do
		line = line .. gethighlight(tab, current) .. " " .. getname(tab) .. " "
	end
	return line .. "%#TabClear#"
end

return M
