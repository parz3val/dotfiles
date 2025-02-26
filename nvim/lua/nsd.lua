local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local config = require('telescope.config').values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local previewers = require('telescope.previewers')
local log = require('plenary.log'):new()

log.level = 'debug'
local session_dir = "~/.config/nsd/"

local function close_non_file_buffers()
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		vim.api.nvim_buf_call(bufnr, function()
			local buftype = vim.bo.filetype
			-- print(buftype)

			if buftype == 'netrw' then
				-- Close the buffer
				vim.cmd(':bdelete! ' .. tostring(bufnr))
			end
		end)


		-- Check if the buffer is non-file (e.g., NERDTree or UndoTree)
	end
end

local function path_to_filename(path, is_reading)
	is_reading = is_reading or "yes"
	-- print(is_reading)

	local encoded = ""
	encoded = path:gsub("\\", "/")
	-- substitute colon as _Q_
	encoded = encoded:gsub(":", "_Q_")
	encoded = encoded:gsub("/", "╱")

	-- if is_reading is false return the encoded path
	if is_reading == "no" then
		return encoded
	else
		if vim.fn.filereadable(session_dir .. "/" .. encoded .. ".vim") == 1 then
			return encoded
		else
			local encoded = ""
			for i = 1, #path do
				encoded = encoded .. string.byte(path, i) .. "_"
			end


			return encoded
		end
	end
end

local function get_files_in_directory(directory_name)
	local files = {}
	local i = 1

	local cmd = "ls -1 " .. directory_name
	local f = io.popen(cmd, "r")
	for file in f:lines() do
		files[i] = { name = file }
		i = i + 1
	end
	f:close()
	return files
end

local function cmd_loader(command)
	log.debug("Loading the session")
	vim.loop.spawn(command, {}, function(code)
		if code == 0 then
			log.debug("Loaded session successfully")
		else
			log.debug("Failed to load session")
		end
	end)
end

local M = {}
M.show_sessions_list = function()
	log.debug("Running the command")
	pickers.new(opts, {
		finder = finders.new_table({
			results = get_files_in_directory("~/.config/nsd"),
			entry_maker = function(entry)
				log.debug("Files are")
				log.debug(entry)
				log.debug("Files were")
				return {
					display = entry.name,
					ordinal = entry.name
				}
			end
		}),
		sorter = config.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr)
			actions.select_default:replace(function()
				local selection = action_state.get_selected_entry()
				local sess = "~/.config/nsd/" .. selection.display
				local command = "source" .. " " .. sess
				close_non_file_buffers()
				vim.cmd("bufdo! if !buflisted(expand('%')) | bd | endif")
				vim.cmd(command)
			end)
			return true
		end
	})
	    :find()
end

M.save_session = function()
	close_non_file_buffers()
	local cwd = path_to_filename(vim.fn.getcwd(), "no")
	print("current working directory is", cwd)
	local session_path = session_dir .. cwd .. ".session"
	print("Session path is " .. session_path)
	vim.cmd("mksession! " .. session_path)

end
return M
