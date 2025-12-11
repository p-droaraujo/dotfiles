-- this plugin allows surrounding chars like ( string )
-- to surround a string: ys + motion + char
-- ex: ys + iw + "
-- to delete: ds + "
-- to change: cs + " + new char
return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}
