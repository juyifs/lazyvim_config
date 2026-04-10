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
      search_key = "<leader>i"
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
    "LintaoAmons/bookmarks.nvim",
    -- backup your bookmark sqlite db when there are breaking changes (major version change)
    dependencies = {
      { "kkharji/sqlite.lua" },
      { "nvim-telescope/telescope.nvim" }, -- currently has only telescopes supported, but PRs for other pickers are welcome
      { "stevearc/dressing.nvim" }, -- optional: better UI
    },
    config = function()
      local opts = {
        picker = {
          entry_display = function(bookmark, bookmarks)
            return string.format("%s", bookmark.name)
          end,
        },
      }
      require("bookmarks").setup(opts) -- you must call setup to init sqlite db
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
}
