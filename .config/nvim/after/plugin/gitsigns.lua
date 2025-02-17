-- TODO: still broken, changed lines seems to not be shown
require('gitsigns').setup {
    signs = {
        add = { text = "▎" },
        change = { "▎" },
        delete = { text = "-" },
        topdelete = { text = "-" },
        changedelete = { text = "▎" },
    },
  -- numhl = false, 
  -- linehl = false,
    -- word_diff = true,
}
-- require('gitsigns').setup {
--     signs = {
--         add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
--         change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
--         delete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
--         topdelete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
--         changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
--     },
-- }
