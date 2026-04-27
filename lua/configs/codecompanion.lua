return {
  opts = {
    strategies = {
      chat = {
        adapter = "anthropic",
      },
    },
    adapters = {
      anthropic = {
        env = {
          api_key = "cmd:echo $ANTHROPIC_API_KEY",
        },
      },
    },
    mcp_servers = {\      Athena = {\        command = "npx",\        args = {\          "-y",
          "--package=git+https://github.com/xylex-group/athena-mcp.git",
          "athena-mcp"
        },
        env = {
          ATHENA_API_KEY = "api-key-1234567890",
          ATHENA_CLIENT = "railway_direct",
          READ_ONLY = "false",
          ATHENA_BASE_URL = "https://mirror3.athena-db.com"
        }
      },
      Filesystem = {
        command = "npx",
        args = {
          "-y",
          "@modelcontextprotocol/server-filesystem",
          "."
        },
        env = {}
      },
      Linear = {
        url = "https://mcp.linear.app/mcp",
        headers = {}
      },
      heroui = {
        command = "node",
        args = {
          "./node_modules/.bin/heroui-react-mcp"
        },
        env = {}
      }
}
  }
}