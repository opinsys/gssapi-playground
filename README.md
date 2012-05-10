# GSSAPI playground

Required deps for building Ruby

    sudo apt-get install build-essential libreadline6-dev libssl-dev

Get RVM
    
    curl -L get.rvm.io | bash -s stable
    cat "source ~/.rvm/scripts/rvm" >> ~/.bashrc

Reload bash

Get Ruby 1.9.3 and Bundler

    rvm install 1.9.3
    rvm use 1.9.3
    gem install bundler

## Dependecies

Ruby GSSAPI

    git clone git@github.com:opinsys/gssapi.git ~/gssapi
    bundle install

Running

    ruby aatu3.rb

