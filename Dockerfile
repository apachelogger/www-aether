FROM ubuntu:16.04
MAINTAINER Harald Sitter <sitter@kde.org>
EXPOSE 8080

ADD bootstrap.sh /usr/local/bin/bootstrap.sh
ADD bootstrap.rb /usr/local/bin/bootstrap.rb
ADD deploy-aether.rb /usr/local/bin/deploy-aether.rb
ADD god /god
ADD vhost.conf /tmp/vhost.conf

RUN bootstrap.sh

CMD god -c /god
