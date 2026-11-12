return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        -- Disable the static indent guide characters...
        indent = { enabled = false },
        -- ...but keep the animated current-scope indicator.
        scope = { enabled = true },
      },
    },
  },
}
