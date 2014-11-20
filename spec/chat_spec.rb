# -*- coding: utf-8 -*-
require 'coveralls'
Coveralls.wear!

require_relative '../chat.rb'
ENV['RACK_ENV'] = 'test'
require 'rack/test'
require 'rubygems'
require 'rspec'

include Rack::Test::Methods

describe "Test Chat App: Comprobacion de metodos" do
end