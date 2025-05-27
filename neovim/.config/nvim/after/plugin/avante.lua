local avante = require('avante')

avante.setup({
  provider = "internal",
  vendors = {
      internal = {
          __inherited_from = "openai",
          endpoint = "http://127.0.0.1:8899/v1",
          model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
          timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
          temperature = 0,
          max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
          reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
      }
  },
  behaviour = {
    auto_set_highlight_group = true,
    auto_apply_diff_after_generation = false,
  },
  windows = {
    wrap = true,
    width = 40,
  },
})
