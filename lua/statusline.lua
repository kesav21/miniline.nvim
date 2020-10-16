
local M = {}

local config = {
	["n"]  = {name = " N ", hi = "%#StatusModeCyan#"},

	["v"]  = {name = " V ", hi = "%#StatusModeYellow#"},
	["V"]  = {name = " V ", hi = "%#StatusModeYellow#"},
	[""] = {name = " V ", hi = "%#StatusModeYellow#"},

	["i"]  = {name = " I ", hi = "%#StatusModeBlue#"},
	["ic"] = {name = " I ", hi = "%#StatusModeBlue#"},

	["c"]  = {name = " C ", hi = "%#StatusModePink#"},
}

setmetatable(config, {
	__index = function(t, mode)
		return {name = " " .. mode .. " ", hi = "%#StatusModeRed#"}
	end
})

vim.api.nvim_command("hi StatusModeCyan   guifg=#1d2021 guibg=#689d6a gui=bold")
vim.api.nvim_command("hi StatusModeBlue   guifg=#1d2021 guibg=#458588 gui=bold")
vim.api.nvim_command("hi StatusModeYellow guifg=#1d2021 guibg=#d79921 gui=bold")
vim.api.nvim_command("hi StatusModePink   guifg=#1d2021 guibg=#b16286 gui=bold")
vim.api.nvim_command("hi StatusModeRed    guifg=#1d2021 guibg=#cc241d gui=bold")
vim.api.nvim_command("hi StatusLight      guifg=#1d2021 guibg=#a89984")
vim.api.nvim_command("hi StatusDark       guifg=#ebdbb2 guibg=#3c3836")
vim.api.nvim_command("hi StatusDarker     guifg=#a89984 guibg=#282828")

function readline(filename)
	file = io.open(filename)
	if file then
		for line in io.lines(filename) do
			io.close(file)
			return line
		end
	end
end

function getbranch()
	local line = readline(".git/HEAD")
	if line then
		return " שׂ " .. string.sub(line, 17) .. " "
	else
		return ""
	end
end

function getft()
	ft = vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'filetype')
	if ft ~= "" then
		return " [" .. ft .. "] "
	else
		return ""
	end
end

function M.getline()
	local mode = vim.api.nvim_get_mode()["mode"]
	return config[mode]["hi"]
		.. config[mode]["name"]
		.. "%#StatusDark#"
		.. getbranch()
		.. "%#StatusDarker#"
		.. " %F"
		.. " %="
		.. " %m"
		.. " %r"
		.. "%#StatusDark#"
		.. getft()
		.. "%#StatusLight#"
		.. " %cC"
		.. " %l/%LL "
end

return M
