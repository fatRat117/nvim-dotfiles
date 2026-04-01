# Neovim Configuration

一个模块化、易于扩展的 Neovim 配置，基于 [lazy.nvim](https://github.com/folke/lazy.nvim) 插件管理器。

## 目录

- [快速开始](#快速开始)
- [目录结构](#目录结构)
- [核心功能](#核心功能)
- [如何使用](#如何使用)
  - [安装](#安装)
  - [基础操作](#基础操作)
- [扩展配置](#扩展配置)
  - [添加新插件](#添加新插件)
  - [添加 LSP 服务器](#添加-lsp-服务器)
  - [配置 LSP](#配置-lsp)
  - [添加代码格式化工具](#添加代码格式化工具)
  - [自定义快捷键](#自定义快捷键)
  - [修改编辑器选项](#修改编辑器选项)

## 快速开始

### 要求

- Neovim >= 0.10.0
- Git
- Nerd Font（推荐，用于显示图标）
- `make` 或 `gmake`（用于编译 telescope-fzf-native）

### 安装

1. 备份现有配置（如有）：
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. 克隆配置：
```bash
git clone <your-repo-url> ~/.config/nvim
```

3. 启动 Neovim：
```bash
nvim
```

Lazy.nvim 会自动安装所有插件。安装完成后重启 Neovim 即可。

## 目录结构

```
~/.config/nvim/
├── init.lua                 # 入口文件
├── lazy-lock.json          # 插件版本锁定
├── lua/
│   ├── options.lua         # 编辑器选项配置
│   ├── keymaps.lua         # 快捷键配置
│   ├── lazy-bootstrap.lua  # lazy.nvim 引导
│   ├── lazy-plugins.lua    # 插件列表
│   └── plugins/            # 插件配置目录
│       ├── alpha.lua       # 启动页
│       ├── blink-cmp.lua   # 自动补全
│       ├── bufferline.lua  # 标签栏
│       ├── conform.lua     # 代码格式化
│       ├── gitsigns.lua    # Git 集成
│       ├── lspconfig.lua   # LSP 配置
│       ├── lspsaga.lua     # LSP UI 增强
│       ├── mini.lua        # 工具集合
│       ├── neo-tree.lua    # 文件树
│       ├── noice.lua       # UI 美化
│       ├── telescope.lua   # 模糊搜索
│       ├── treesitter.lua  -- 语法高亮
│       └── which-key.lua   # 快捷键提示
└── README.md
```

## 核心功能

- **🎨 主题**: Gruvbox（默认）、Kanagawa、Solarized Osaka
- **📁 文件管理**: Neo-tree 文件浏览器 + Telescope 模糊搜索
- **🔍 智能搜索**: Telescope 支持文件、文本、符号搜索
- **⚡ LSP 支持**: 完整的语言服务器协议支持
- **📝 自动补全**: Blink.cmp 提供快速补全体验
- **🎭 语法高亮**: Treesitter 提供精确的语法解析
- **🔧 代码格式化**: Conform.nvim 自动格式化
- **📊 Git 集成**: Gitsigns 显示代码变更
- **⌨️ 快捷键提示**: Which-key 显示可用快捷键

## 如何使用

### 基础操作

#### 文件操作
| 快捷键 | 功能 |
|--------|------|
| `<leader>e` | 打开/关闭文件树 |
| `<leader>sf` | 搜索文件 |
| `<leader>sg` | 全局文本搜索 |
| `<leader>sr` | 恢复上次搜索 |

#### 窗口导航
| 快捷键 | 功能 |
|--------|------|
| `<Ctrl-h/j/k/l>` | 在窗口间移动 |
| `<leader>b` | 打开 Buffer 列表 |

#### LSP 操作
| 快捷键 | 功能 |
|--------|------|
| `gd` | 跳转到定义 |
| `gr` | 查找引用 |
| `K` | 显示文档 |
| `<leader>rn` | 重命名符号 |
| `<leader>ca` | 代码操作 |
| `[d` / `]d` | 上一个/下一个诊断 |

#### Git 操作
| 快捷键 | 功能 |
|--------|------|
| `]c` / `[c` | 下一个/上一个变更 |
| `<leader>hs` | Stage hunk |
| `<leader>hp` | 预览 hunk |
| `<leader>hb` |  blame 当前行 |

## 扩展配置

### 添加新插件

在 `lua/plugins/` 目录下创建新的 Lua 文件：

```lua
-- lua/plugins/my-plugin.lua
return {
    "author/plugin-name",
    event = "VeryLazy",  -- 可选：延迟加载事件
    dependencies = {
        "dependency/plugin",
    },
    opts = {
        -- 插件配置选项
    },
    config = function(_, opts)
        require("plugin-name").setup(opts)
        -- 额外的配置代码
    end,
}
```

然后在 `lua/lazy-plugins.lua` 中引入：

```lua
require("lazy").setup({
    -- ... 其他插件
    require("plugins.my-plugin"),
}, { ... })
```

**示例：添加 nvim-tree（替代 neo-tree）**

```lua
-- lua/plugins/nvim-tree.lua
return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = { width = 30 },
            renderer = { group_empty = true },
            filters = { dotfiles = false },
        })
    end,
}
```

### 添加 LSP 服务器

编辑 `lua/plugins/lspconfig.lua`：

```lua
-- 在 servers 表中添加新的 LSP
local servers = {
    -- 现有配置
    lua_ls = { ... },
    
    -- 添加新的 LSP
    pyright = {
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "basic",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                },
            },
        },
    },
    
    -- 简单的 LSP，无需额外配置
    rust_analyzer = {},
    gopls = {},
    tsserver = {},
}
```

**常用 LSP 服务器列表：**

| 语言 | LSP 服务器 | 安装命令 |
|------|-----------|----------|
| Python | pyright / basedpyright | `:MasonInstall pyright` |
| Rust | rust_analyzer | `:MasonInstall rust-analyzer` |
| Go | gopls | `:MasonInstall gopls` |
| TypeScript | ts_ls | `:MasonInstall typescript-language-server` |
| C/C++ | clangd | `:MasonInstall clangd` |
| Java | jdtls | `:MasonInstall jdtls` |

### 配置 LSP

#### 1. 修改诊断显示

在 `lua/plugins/lspconfig.lua` 中修改 `vim.diagnostic.config`：

```lua
vim.diagnostic.config({
    virtual_text = {
        prefix = "●",  -- 诊断前缀图标
        spacing = 4,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})
```

#### 2. 添加 LSP 快捷键

在 `lua/plugins/lspconfig.lua` 的 `LspAttach` 回调中添加：

```lua
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end
        
        -- 添加自定义快捷键
        map("<leader>f", vim.lsp.buf.format, "[F]ormat document")
        map("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
        map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
    end,
})
```

#### 3. 配置 LSP 能力

在 `lua/plugins/lspconfig.lua` 中修改 capabilities：

```lua
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- 添加额外的能力
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
}
```

### 添加代码格式化工具

编辑 `lua/plugins/conform.lua`：

```lua
opts = {
    formatters_by_ft = {
        lua = { "stylua" },
        yaml = { "yamlfmt" },
        -- 添加新的格式化工具
        python = { "black", "isort" },  -- 按顺序运行多个
        javascript = { "prettierd", "prettier", stop_after_first = true },
        rust = { "rustfmt" },
        go = { "gofmt", "goimports" },
    },
}
```

**安装格式化工具：**

```vim
:MasonInstall black isort prettierd stylua
```

### 自定义快捷键

编辑 `lua/keymaps.lua`：

```lua
local keymap = vim.keymap

-- 普通模式快捷键
keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- 视觉模式快捷键
keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- 插入模式快捷键
keymap.set("i", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

-- 使用 Lua 函数的快捷键
keymap.set("n", "<leader>x", function()
    -- 自定义逻辑
    print("Hello from custom keymap!")
end, { desc = "Custom action" })
```

### 修改编辑器选项

编辑 `lua/options.lua`：

```lua
local opt = vim.opt

-- 修改现有选项
opt.number = true
opt.relativenumber = true  -- 启用相对行号
opt.tabstop = 2            -- Tab 宽度改为 2
opt.shiftwidth = 2

-- 添加新选项
opt.colorcolumn = "80"     -- 显示 80 列标记线
opt.showmatch = true       -- 显示匹配的括号
opt.matchtime = 2          -- 匹配括号高亮时间

-- 禁用某些选项
opt.wrap = true            -- 启用自动换行
```

## 故障排除

### 插件未加载

1. 检查 `lazy-lock.json` 是否存在
2. 运行 `:Lazy sync` 同步插件
3. 检查 `:checkhealth lazy` 输出

### LSP 未启动

1. 确认 LSP 已安装：`:Mason`
2. 检查 `:LspInfo` 查看当前缓冲区状态
3. 查看 `:messages` 中的错误信息

### 快捷键冲突

使用 `:verbose map <key>` 查看快捷键被哪个插件映射。

## 参考资源

- [Neovim 官方文档](https://neovim.io/doc/)
- [Lazy.nvim 文档](https://lazy.folke.io/)
- [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim)
- [LSP 配置参考](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
