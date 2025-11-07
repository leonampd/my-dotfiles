local avante = require('avante')

avante.setup({
  provider = "internal",
  providers = {
      internal = {
          __inherited_from = "openai",
          endpoint = "http://127.0.0.1:8899/v1",
          model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
          timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
          extra_request_body = {
              temperature = 0,
              max_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
              reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
          }
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
  system_prompt = function()
    local hub = require("mcphub").get_hub_instance()
    return hub and hub:get_active_servers_prompt() or ""
  end,
  custom_tools = function()
    return {
        require("mcphub.extensions.avante").mcp_tool(),
    }
  end
})
