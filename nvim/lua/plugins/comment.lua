-- this plugin enables "gc" command to comment code.
-- -- "gcc" comments a line

return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      -- When using Comment.nvim's pre_hook, disable the CursorHold autocmd.
      -- Leaving it on causes: attempt to index local 'language_tree' (a nil value)
      -- for buffers without a treesitter parser (or before the parser is ready).
      opts = {
        enable_autocmd = false,
      },
    },
  },
  config = function()
    local comment = require("Comment")
    local comment_ft = require("Comment.ft")
    local ts_pre = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()

    ---Resolve a line/block commentstring without using Comment.ft.calculate().
    ---On Neovim 0.12+, vim.treesitter.get_parser() returns nil (not an error)
    ---when no parser is installed. Comment.nvim's calculate() still indexes
    ---that nil value → "[Comment.nvim] nil". Returning a real string here
    ---skips that broken path.
    local function fallback_cstr(ctx)
      local cstr = comment_ft.get(vim.bo.filetype, ctx.ctype)
      if type(cstr) == "string" and cstr ~= "" then
        return cstr
      end
      local native = vim.bo.commentstring
      if type(native) == "string" and native:find("%%s") then
        return native
      end
      -- conf-like / unknown filetypes (e.g. ghostty config)
      return "#%s"
    end

    comment.setup({
      pre_hook = function(ctx)
        local ok, result = pcall(ts_pre, ctx)
        if ok and type(result) == "string" and result ~= "" then
          return result
        end
        return fallback_cstr(ctx)
      end,
    })
  end,
}
