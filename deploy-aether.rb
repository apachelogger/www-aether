#!/usr/bin/env ruby

require 'fileutils'

Dir.chdir('/var/www/aether') do
  system('git', 'fetch') || raise
  system('git', 'reset', '--hard', 'origin/master') || raise
  FileUtils.cp_r(Dir.glob('*'), '/var/www/www/sites/www/', verbose: true) || raise
  FileUtils.cp('.htaccess', '/var/www/www/sites/www/', verbose: true)
  system('a2enmod', 'rewrite') || raise
  system('a2enmod', 'deflate') || raise
end
