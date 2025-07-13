local M = {}

local blender_path = "/usr/bin/blender"

function M.setup()
	vim.api.nvim_create_user_command("BlenderStart", function()
		local args = { "--app_template", "VSCode" }

		local job_id = vim.fn.jobstart({ blender_path, unpack(args) }, {})
	end, {})
end

return M
