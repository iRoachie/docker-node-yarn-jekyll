FROM starefossen/ruby-node
MAINTAINER iRoachie <kroach.work@gmail.com>

LABEL Description: Docker image containing Jekyll, Node with Yarn, Gulp, Surge

RUN apt-get update && apt-get install lftp
RUN gem install jekyll bundler
RUN npm set progress=false && \
    npm install -g --progress=false yarn surge gulp