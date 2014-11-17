# -*- coding: utf-8 -*-
require_relative '../chat.rb'
require 'test/unit'
require 'minitest/autorun'
require 'rack/test'
require 'selenium-webdriver'
require 'rubygems'

include Rack::Test::Methods

def app
   Sinatra::Application
end

describe "Test Chat App: Comprobacion de paginas y enlaces" do
   
   before :all do
	  @browser = Selenium::WebDriver.for :firefox
	  @site = 'http://sytw6.herokuapp.com/'
	  if (ARGV[0].to_s == "local")
		 @site = 'http://localhost:4567/'
	  end
	  @browser.get(@site)
	  @wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
   end

   after :all do
	  @browser.quit
   end

   it "I can access index page" do
	  assert_equal(@site, @browser.current_url)
   end
   
   it "I can see index page" do
	  element = @browser.find_element(:id,"title").text
	  assert_equal("Bienvenido a nuestro chat", element)
   end

   it "I can access rules page" do
	  @browser.find_element(:id,"bar_menu").find_element(:xpath,'.//*[contains(.,"Rules")]').click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal(@site+"#rules", @browser.current_url)
   end

   it "I can see rules page" do
	  element = @browser.find_element(:id,"rules").find_element(:xpath,'.//*[contains(.,"las normas")]').text
	  assert_equal("RULES CHAT", element[0,10])
   end

# Top, help, repository, ULL, etsii
end

describe "Test Chat App: Comprobacion de control" do

end

describe "Test Chat App: Funcionalidades" do
end