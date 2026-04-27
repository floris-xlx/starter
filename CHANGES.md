# Neovim Configuration Changes

**Date:** 2026-02-27

## Added CodeCompanion.nvim Plugin

### Plugin Installation
Added `olimorris/codecompanion.nvim` (version ^19.0.0) to lazy.nvim with the following dependencies:
- `nvim-lua/plenary.nvim`
- `nvim-treesitter/nvim-treesitter`
- `ravitemer/mcphub.nvim`

### MCP Server Configuration
Created `lua/configs/codecompanion.lua` with MCP server configurations for:

1. **Athena** - Database access tool
   - Command: npx with git+https://github.com/xylex-group/athena-mcp.git
   - Configured for railway_direct client with mirror3.athena-db.com

2. **Filesystem** - File system access
   - Command: npx with @modelcontextprotocol/server-filesystem
   - Access to current directory

3. **Linear** - Project management
   - URL: https://mcp.linear.app/mcp
   - HTTP-based MCP server

4. **heroui-react** - HeroUI React component library
   - Node-based MCP server
   - Component library access

### Files Modified
- `lua/plugins/init.lua` - Added codecompanion plugin
- `lua/configs/codecompanion.lua` - Created with MCP server configs

## Usage
After restarting Neovim or running `:Lazy sync`, the CodeCompanion plugin will be installed and all MCP servers will be available for use.