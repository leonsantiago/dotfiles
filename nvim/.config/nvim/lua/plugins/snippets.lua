return {
  {
    "nvim-mini/mini.snippets",
    opts = function(_, opts)
      local S = require("mini.snippets")
      -- Merge Ruby + Rails snippets, and add ERB for views
      opts.snippets = {
        S.gen_loader.from_lang({
          -- Map a filetype to multiple snippet files found in runtimepath
          -- (friendly-snippets provides ruby.json, erb.json, and frameworks/rails.json)
          lang_patterns = {
            ruby  = { "ruby.json", "frameworks/rails.json" },
            eruby = { "erb.json" },
          },
        }),
      }
    end,
  },
}
