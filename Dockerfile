FROM amazonlinux:2
ARG RUBY_VERSION=2.4.2
ENV PATH="/root/.rbenv/shims:$PATH"

RUN yum update -y
RUN yum install -y git bzip2 tar gcc make openssl-devel readline-devel zlib-devel sqlite-devel
RUN git clone --depth 1 https://github.com/rbenv/rbenv.git /root/.rbenv
RUN git clone --depth 1 https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN /root/.rbenv/bin/rbenv install -v ${RUBY_VERSION}
RUN /root/.rbenv/bin/rbenv global ${RUBY_VERSION}
RUN gem install bundler


RUN curl -o /etc/yum.repos.d/yarn.repo https://dl.yarnpkg.com/rpm/yarn.repo
RUN curl -sL https://rpm.nodesource.com/setup_11.x | bash -
RUN yum install -y yarn

WORKDIR /root/sample_unicorn_worker_killer/
COPY . /root/sample_unicorn_worker_killer/

RUN amazon-linux-extras install -y nginx1
COPY server/nginx.conf /etc/nginx/nginx.conf

RUN bundle install

CMD "bundle" "exec" "unicorn_rails" "-c" "config/unicorn.rb" "-E" "development"
