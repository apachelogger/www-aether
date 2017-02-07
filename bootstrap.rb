#!/usr/bin/env ruby

require 'fileutils'

AETHER_REPO = 'git://anongit.kde.org/scratch/kvermette/www-aether'.freeze
CAPACITY_REPO = 'git://anongit.kde.org/websites/capacity'.freeze

def install(pkgs)
  system('apt', 'install', '--assume-yes', *pkgs) || raise
end

def co(path)
  system('svn', 'checkout', '--non-recursive', path) || raise
  Dir.chdir(File.basename(path)) { yield } if block_given?
end

def up(path)
  system('svn', 'up', '--non-recursive', path) || raise
  Dir.chdir(File.basename(path)) { yield } if block_given?
end

def up_r(path)
  system('svn', 'up', path) || raise
  Dir.chdir(File.basename(path)) { yield } if block_given?
end

install(%w(apache2 libapache2-mod-php php-mysql mysql-server))
install(%w(git subversion))

Dir.chdir('/var/www') do
  system('git', 'clone', '--depth=1', AETHER_REPO, 'aether') || raise
  system('git', 'clone', '--depth=1', CAPACITY_REPO, 'media') || raise
  co('svn://anonsvn.kde.org/home/kde/trunk/www') do
    up('sites') do
      up_r('www')
    end
  end
end

Dir.chdir('/var/www/media/includes') do
  data = File.read('db_auth.inc.default')
  data.gsub!('"user"', '"root"')
  data.gsub!('"pass"', '""')
  File.write('db_auth.inc', data)
end

FileUtils.mkdir('/var/run/mysqld')
FileUtils.chown('mysql', 'mysql', '/var/run/mysqld')

FileUtils.rm(Dir.glob('/etc/apache2/sites-enabled/*'))
FileUtils.cp('/tmp/vhost.conf', '/etc/apache2/sites-enabled/www.kde.org.conf')
