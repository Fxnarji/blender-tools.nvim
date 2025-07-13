local M = {}

local blender_path = "/usr/bin/blender"

function M.setup()
	vim.api.nvim_create_user_command("BlenderStart", function()
		print("Hello Wooooorld!")
		print(vim.inspect(vim.env.PATH))
		vim.fn.jobstart({ "blender" }, {
			on_exit = function(_, code)
				print("Blender exited with code " .. code)
			end,
		})
	end, {})
end
return M
