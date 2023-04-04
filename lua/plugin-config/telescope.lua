local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("telescope not found")
  return
end

telescope.setup({
  defaults = {
    initial_mode = "insert",
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    find_files = {
      -- theme params: dropdown, cursor, ivy
      -- theme = "dropdown", 
    }
  },
  extensions = {
     -- telescope plugin
  },
})
