FROM kkarczmarczyk/node-yarn
MAINTAINER iRoachie <kroach.work@gmail.com>

LABEL Description="Node, with Yarn instaleld"

RUN apt-get update && apt-get install -y \
	curl \
	libxml2-dev \
	libxslt-dev \
	libcurl4-openssl-dev \
	libreadline6-dev \
	libssl-dev \
	patch \
	build-essential \
	zlib1g-dev \
	openssh-server \
	libyaml-dev \
	libicu-dev \
	rsync \
	libmysqlclient-dev \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir /tmp/ruby
RUN cd /tmp/ruby && curl --silent ftp://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz | tar xz
RUN cd /tmp/ruby/ruby-2.2.3 && ./configure --disable-install-rdoc && make install

RUN gem install jekyll bundler