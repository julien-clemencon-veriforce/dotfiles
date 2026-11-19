return {
  {
    dir = vim.fn.expand("~/Developer/note-to-self"),
    name = "note-to-self",
    cmd = "NoteToSelf",
    keys = {
      { "<leader>N", "<cmd>NoteToSelf<cr>", mode = "n", desc = "Note to Self" },
    },
  },
}
