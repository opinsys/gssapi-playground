
# GSSAPI playground

Get Ruby 1.9.3

    sudo apt-get install readline6-dev libssl-dev
    curl -L get.rvm.io | bash -s stable
    cat "source ~/.rvm/scripts/rvm" >> ~/.bashrc

Reload bash

    rvm install 1.9.3
    rvm use 1.9.3
    gem install bundler

## Dependecies

Ruby GSSAPI

    git clone git@github.com:opinsys/gssapi.git ~/gssapi
    bundle install

Running

    ruby aatu3.rb

