local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger"
    },
    ["<leader>dx"] = {
      "<cmd> DapTerminate <CR>",
      "Terminate the debugger"
    },
    ["<leader>du"] = {
      "<cmd> DapUiToggle <CR>",
      "Toggle the debugger UI"
    },
    ["<leader>dsO"] = {
      "<cmd> DapStepOver <CR>",
      "Step over"
    },
    ["<leader>dsI"] = {
      "<cmd> DapStepInto <CR>",
      "Step into"
    },
    ["<leader>dsO"] = {
      "<cmd> DapStepOut <CR>",
      "Step out"
    },
    ["<leader>dl"] = {
      "<cmd> DapShowLog <CR>",
      "Show the debugger log"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require ('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.crates = {
  n = {
    ["<leader>rcu"] ={
      function ()
        require('crates').upgrade_all_crates()
      end,
        "upgrade crates"
    }
  }
}

return M
