require'clipboard-image'.setup {
  -- Default configuration for all filetype
  default = {
    img_dir = {"images"}, -- Use table for nested dir (New feature form PR #20)
    img_dir_txt = "images",
    -- img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end, -- Example result: "2021-04-13-10-04-18"
    img_name = function ()
      vim.fn.inputsave()
      local name = vim.fn.input('Name: ')
      vim.fn.inputrestore()
      if name == nil or name == '' then
        return os.date('%Y-%m-%d-%H-%M-%S')
      end
      return name
    end,
    -- affix = "![](%s)" -- Multi lines affix
    affix = "\n<p align=\"center\">\n  <img src=\"/%s\" />\n</p>" -- Multi lines affix
  },
}
