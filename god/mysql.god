God.watch do |w|
  w.name = 'mysql'
  w.start = '/usr/bin/mysqld_safe'
  w.pid_file = '/var/run/mysqld/mysqld.pid'
  w.keepalive
end
