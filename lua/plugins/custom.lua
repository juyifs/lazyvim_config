return {
  {
    "Mr-LLLLL/interestingwords.nvim",
    opts = {
      colors = {
        "#aeee00",
        "#ff0000",
        "#0000ff",
        "#b88823",
        "#ffa724",
        "#ff2c4b",
        "#FF5733",
        "#33FF57",
        "#3357FF",
        "#FF33A8",
        "#FFD133",
        "#33FFF5",
        "#A833FF",
        "#FF8C33",
        "#33FF8C",
        "#8C33FF",
        "#FF3333",
        "#33FF33",
        "#3333FF",
        "#FFB733",
        "#33B7FF",
        "#B733FF",
        "#FF33D1",
        "#33FFD1",
        "#D1FF33",
        "#FF6633",
      },
      search_key = "<leader>i",
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        -- 关闭名称截断
        truncate_names = false,
        -- 设置最大文件名长度（设为足够大的值）
        max_name_length = 50,
        always_show_bufferline = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "jb",
    },
  },
  {
    "nickkadutskyi/jb.nvim",
    lazy = false,
    priority = 1000, -- 确保优先加载
    config = function()
      vim.cmd("colorscheme jb") -- 默认开启
      -- 如果需要透明背景，取消下一行的注释
      -- require("jb").setup({ transparent = true })
    end,
  },
  {
    "uga-rosa/translate.nvim",
    config = function()
      require("translate").setup({
        default = {
          command = "google",
          output = "floating", -- 默认输出到浮窗
        },
      })
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        formatters = {
          file = {
            filename_only = true, -- 关键设置：只显示文件名
          },
        },
        layouts = {
          vertical_custom = {
            layout = {
              box = "vertical",
              width = 0.9,
              min_width = 120,
              height = 0.9,
              { win = "preview", title = "{preview}", border = true, height = 0.7 },
              {
                box = "vertical",
                border = true,
                title = "{title} {live} {flags}",
                { win = "input", height = 1, border = "bottom" },
                { win = "list", border = "none" },
              },
            },
          },
          horizontal_custom = {
            layout = {
              box = "horizontal",
              width = 0.9,
              min_width = 120,
              height = 0.9,
              {
                box = "vertical",
                border = true,
                title = "{title} {live} {flags}",
                { win = "input", height = 1, border = "bottom" },
                { win = "list", border = "none" },
              },
              { win = "preview", title = "{preview}", border = true, width = 0.6 },
            },
          },
        },
        layout = {
          preset = "horizontal_custom",
        },
        sources = {
          lines = {
            layout = {
              preview = "preview",
              preset = "horizontal_custom",
            },
          },
          files = {
            layout = {
              preview = "preview",
              preset = "horizontal_custom",
            },
          },
          qflist = {
            layout = {
              preview = "preview",
              preset = "vertical_custom",
            },
          },
          gh_diff = {
            layout = {
              preview = "preview",
              preset = "vertical_custom",
            },
          },
          git_diff = {
            layout = {
              preview = "preview",
              preset = "vertical_custom",
            },
          },
          git_files = {
            layout = {
              preview = "preview",
              preset = "vertical_custom",
            },
          },
          git_log = {
            layout = {
              preview = "preview",
              preset = "vertical_custom",
            },
          },
          git_log_file = {
            layout = {
              preview = "preview",
              preset = "vertical_custom",
            },
          },
          git_log_line = {
            layout = {
              preview = "preview",
              preset = "vertical_custom",
            },
          },
          git_stash = {
            layout = {
              preview = "preview",
              preset = "vertical_custom",
            },
          },
          git_status = {
            layout = {
              preview = "preview",
              preset = "vertical_custom",
            },
          },
        },
      },
      bigfile = {
        size = 30 * 1024 * 1024,
      },
    },
  },
  {
    "MattesGroeger/vim-bookmarks",
    config = function()
      -- 这里的配置可以根据需要修改图标或行为
      vim.g.bookmark_sign = "🔖"
      vim.g.bookmark_annotation_sign = "📝" -- 有备注的书签显示不同图标
      vim.g.bookmark_save_per_working_dir = 1 -- 按项目保存书签
      vim.g.bookmark_auto_save = 1
    end,
  },
  {
    "sindrets/diffview.nvim",
    opts = {
      file_panel = {
        win_config = {
          position = "bottom", -- 将默认的 "left" 改为 "bottom"
          height = 8, -- 变成底部面板后，建议使用 height 代替 width 控制高度
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        documentation = {
          auto_show = false,
        },
      },
    },
  },
  {
    "jmacadie/telescope-hierarchy.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    config = function(_, opts)
      -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
      -- configs for us. We won't use data, as everything is in it's own namespace (telescope
      -- defaults, as well as each extension).
      require("telescope").setup(opts)
      require("telescope").load_extension("hierarchy")
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true, -- 开启 LSP 文档浮动窗口的圆角边框
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
        -- stylua: ignore
        keys = {
          { "gr", false },
        },
        },
      },
    },
  },
}
