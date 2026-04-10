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
        layout = {
          layout = {
            backdrop = false,
            width = 0.85,
            min_width = 80,
            height = 0.85,
            min_height = 20,
            box = "vertical",
            border = true,
            title = "{title} {live} {flags}",
            title_pos = "center",
            { win = "input", height = 1, border = "bottom" },
            { win = "list", border = "none" },
            { win = "preview", title = "{preview}", height = 0.65, border = "top" },
          },
        },
      },
      bigfile = {
        size = 30 * 1024 * 1024,
      },
    },
  },
}
