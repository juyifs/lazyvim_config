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
      colorscheme = "everforest",
    },
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        background = "medium",
      })
    end,
  },
  {
    "lionyxml/gitlineage.nvim",
    dependencies = {
      "sindrets/diffview.nvim", -- optional, for open_diff feature
    },
    config = function()
      require("gitlineage").setup()
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
        layouts = {
          default_custom = {
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
          preset = "default_custom",
        },
        sources = {
          lines = {
            layout = {
              preview = "preview",
              preset = "default_custom",
            },
          },
          files = {
            layout = {
              preview = "preview",
              preset = "default_custom",
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
}
