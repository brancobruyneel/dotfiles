local M = {}

---@param kind string
function M.pick(kind)
	return function()
		local actions = require("CopilotChat.actions")
		local items = actions[kind .. "_actions"]()
		if not items then
			return
		end
		local ok = pcall(require, "fzf-lua")
		require("CopilotChat.integrations." .. (ok and "fzflua" or "telescope")).pick(items)
	end
end

return {

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		branch = "main",
		lazy = false,
		build = "make tiktoken", -- Only on MacOS or Linux
		cmd = "CopilotChat",
		opts = function()
			local user = vim.env.USER or "User"
			user = user:sub(1, 1):upper() .. user:sub(2)
			return {
				show_help = true,
				question_header = "  " .. user .. " ",
				answer_header = "  Copilot ",
				chat_autocomplete = true,
				window = {
					width = 0.4,
				},
				prompts = {
					Explain = {
						mapping = '<leader>ae',
						description = 'AI Explain',
					},
					Review = {
						mapping = '<leader>ar',
						description = 'AI Review',
					},
					Tests = {
						mapping = '<leader>at',
						description = 'AI Tests',
					},
					Fix = {
						mapping = '<leader>af',
						description = 'AI Fix',
					},
					Optimize = {
						mapping = '<leader>ao',
						description = 'AI Optimize',
					},
					Docs = {
						mapping = '<leader>ad',
						description = 'AI Documentation',
					},
					CommitStaged = {
						mapping = '<leader>ac',
						description = 'AI Generate Commit',
					},
				},
			}
		end,
		keys = {
			{ "<c-s>",     "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
			{ "<leader>a", "",     desc = "+ai",        mode = { "n", "v" } },
			{
				"<leader>aa",
				function()
					return require("CopilotChat").toggle()
				end,
				desc = "Toggle (CopilotChat)",
				mode = { "n", "v" },
			},
			{
				"<leader>ax",
				function()
					return require("CopilotChat").reset()
				end,
				desc = "Clear (CopilotChat)",
				mode = { "n", "v" },
			},
			{
				"<leader>aq",
				function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						require("CopilotChat").ask(input)
					end
				end,
				desc = "Quick Chat (CopilotChat)",
				mode = { "n", "v" },
			},
			-- Show help actions with telescope
			{ "<leader>ad", M.pick("help"),   desc = "Diagnostic Help (CopilotChat)", mode = { "n", "v" } },
			-- Show prompts actions with telescope
			{ "<leader>ap", M.pick("prompt"), desc = "Prompt Actions (CopilotChat)",  mode = { "n", "v" } },
		},
		config = function(_, opts)
			local chat = require("CopilotChat")

			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-chat",
				callback = function()
					vim.opt_local.relativenumber = false
					vim.opt_local.number = false
				end,
			})

			chat.setup(opts)
		end,
	},
	-- See Commands section for default commands if you want to lazy load on them
}
