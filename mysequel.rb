#!/usr/bin/env ruby

# Hope mysql is up by then.
# If not we will die to a raise, god will restart us and we wait another 5 sec.
# etc. etc.
sleep 5

if File.exist?('/tmp/init.sql')
  system('mysql < /tmp/init.sql') || raise
  File.delete('/tmp/init.sql')
end

sleep
