FROM ubuntu:16.04
MAINTAINER Harald Sitter <sitter@kde.org>
EXPOSE 8080

ADD bootstrap.sh /usr/local/bin/bootstrap.sh
ADD bootstrap.rb /usr/local/bin/bootstrap.rb
ADD deploy-aether.rb /usr/local/bin/deploy-aether.rb
ADD mysequel.rb /usr/local/bin/mysequel.rb
ADD god /god
ADD vhost.conf /tmp/vhost.conf
ADD init.sql /tmp/init.sql

RUN bootstrap.sh

CMD god -c /god -D
