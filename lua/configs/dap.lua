vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

local dap = require "dap"
local wk = require "which-key"

local dap_keymaps = {
  { "<Down>", dap.step_over, desc = "Dap Step Over" },
  { "<Right>", dap.step_into, desc = "Dap Step Into" },
  { "<Left>", dap.step_out, desc = "Dap Step Out" },
  { "<Up>", dap.restart_frame, desc = "Dap Step Out" },
}
local dap_keymaps_active = false

local function set_dap_keymaps()
  -- note: `wk.add(dap_keymaps)` works but clears dap_keymaps
  for _, keymap in ipairs(dap_keymaps) do
    wk.add(keymap)
  end
  dap_keymaps_active = true
end

local function remove_dap_keymaps()
  if dap_keymaps_active then
    dap_keymaps_active = false
    for _, keymap in ipairs(dap_keymaps) do
      vim.keymap.del("n", keymap[1])
      wk.add { keymap[1], hidden = true }
    end
  end
end

dap.listeners.after.event_initialized.dap_keymaps = function()
  set_dap_keymaps()
end
dap.listeners.before.event_terminated.dap_keymaps = function()
  remove_dap_keymaps()
end
dap.listeners.before.event_exited.dap_keymaps = function()
  remove_dap_keymaps()
end
