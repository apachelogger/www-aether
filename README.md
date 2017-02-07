# Use

**Warning:** This bugger contains a full checkout of kde.org, it's super large.

Simply pull through docker (binds to port 80, change if you want other port)
`docker run -p 80:8080 sitter/www-aether`

As the current code partially hardcodes kde.org it may be a good idea to edit
`/etc/hosts` and set kde.org to 127.0.0.1 so all links work.

# MySQL

MySQL is only initializing after a couple of seconds of up time.

# Update

To deploy a new version of the aether git repo in a container run deploy-aether.rb

`docker exec -t CONTAINERNAMEORHASH deploy-aether.rb`
