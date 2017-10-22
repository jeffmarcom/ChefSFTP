#!/bin/bash

CHEF_DEP_LOCK='.chef-deps-installed'
RUBY_DEP_LOCK='.ruby-deps-installed'
GEM_DEP_LOCK='Gemfile.vagrant.lock'
SCL_RUBY='ruby23'
WKDIR='/vagrant'
PATH="$PATH:/usr/local/bin:/opt/rh/rh-${SCL_RUBY}/root/bin"

cd $WKDIR 

if [ ! -f $RUBY_DEP_LOCK ]; then
  sudo yum install -y centos-release-scl scl-utils-build
  sudo yum install -y gcc $SCL_RUBY rh-$SCL_RUBY-ruby-devel.x86_64
  touch $RUBY_DEP_LOCK
fi

scl_cmd() { 
  scl enable rh-${SCL_RUBY} "$1"
}

if [ ! -f $GEM_DEP_LOCK ]; then
  scl_cmd 'gem install bundler'
  scl_cmd 'bundle install'
  touch $GEM_DEP_LOCK
fi

if [ ! -f $CHEF_DEP_LOCK ]; then
  cd 'sftp'
  scl_cmd 'bundle exec librarian-chef install'
  cd -
  touch $CHEF_DEP_LOCK
fi

rm -rf sftp/local-mode-cache
scl_cmd "bundle exec chef-solo -c sftp/solo.rb -j sftp/sftp-test.json"
