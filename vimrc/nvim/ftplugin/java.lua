local install_path = '/usr/bin/jdtls'
-- local ls_version = '1.12.0'
local osystem = 'linux'
local user = 'chimaera'
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_directory = '/home/' .. user .. '/java_data'

local config = {
  cmd = {
    '/usr/local/bin/java_18/java_18_corretto/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', install_path .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', install_path .. '/config_' .. osystem,
    '-data', workspace_directory
  },
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradelw'}),
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-11",
            path = "/usr/lib/java_11_corretto"
          },
          {
            name = "JavaSE-18",
            path = "/usr/local/bin/java_18/java_18_corretto"
          }
        }
      }
    }
  },
  init_options = {
    bundles = {}
  }
}

require('jdtls').start_or_attach(config)
