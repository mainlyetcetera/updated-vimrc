local install_path = '/usr/local/Cellar/jdtls/1.12.0/libexec'
local ls_version = '1.12.0'
local osystem = 'mac'
local user = 'chimera'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_directory = '/Users/' .. user .. '/java_data'

local config = {
  cmd = {
    'java',
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
    java = {}
  },
  init_options = {
    bundles = {}
  }
}

require('jdtls').start_or_attach(config)
