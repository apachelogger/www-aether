#!/usr/bin/env ruby

require 'fileutils'

Dir.chdir('/var/www/aether') do
  system('git', 'fetch') || raise
  system('git', 'reset', '--hard', 'origin/master') || raise
  FileUtils.cp_r(Dir.glob('*'), '/var/www/sites/www/', verbose: true) || raise
end
