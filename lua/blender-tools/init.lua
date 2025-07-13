local M = {}

local blender_path = "/usr/bin/blender"

function M.setup()
	vim.api.nvim_create_user_command("BlenderStart", function()
		print("Hello World!")
		vim.fn.system("Blender &")
	end, {})
end
return M
