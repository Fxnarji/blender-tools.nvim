local M = {}

local blender_path = "/usr/bin/blender"

function M.setup()
	vim.api.nvim_create_user_command("BlenderStart", function()
		local args = { "--app_template", "VSCode" }

		local job_id = vim.fn.jobstart({ blender_path, unpack(args) }, {
			stdout_buffered = true,
			stderr_buffered = true,
			on_stdout = function(_, data)
				if data then
					print(table.concat(data, "\n"))
				end
			end,
			on_stderr = function(_, data)
				if data then
					print("Error:", table.concat(data, "\n"))
				end
			end,
			on_exit = function(_, code)
				print("Blender exited with code:", code)
			end,
		})

		if job_id <= 0 then
			print("❌ Failed to launch Blender")
		else
			print("✅ Blender launched with job ID:", job_id)
		end
	end, {})
end
return M
