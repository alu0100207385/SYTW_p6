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
	  @browser.manage().window().maximize()
	  @browser.manage.timeouts.implicit_wait = 5
# 	  @wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
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
   
   it "I can access top page" do
	  @browser.find_element(:id,"top").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal(@site+"#", @browser.current_url)
   end

   it "I can access repository page" do
	  @browser.find_element(:id,"repository").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal("https://github.com/alu0100207385/SYTW_p6", @browser.current_url)
   end

   it "I can access rules page" do
	  @browser.find_element(:id,"rules1").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal(@site+"#rules", @browser.current_url)
   end

   it "I can see rules page" do
	  element = @browser.find_element(:id,"rules").find_element(:xpath,'.//*[contains(.,"las normas")]').text
	  assert_equal("RULES CHAT", element[0,10])
   end

   it "I can access help page" do
	  @browser.find_element(:id,"help").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal(@site+"help", @browser.current_url)
   end
   
   it "I can see help page" do
	  @browser.find_element(:id,"help").click
	  @browser.manage.timeouts.implicit_wait = 3
	  element = @browser.find_element(:id,"title").find_element(:xpath,'.//*[contains(.,"FRECUENTES")]').text
	  assert_equal("PROBLEMAS FRECUENTES", element)
   end

   it "I can access credits page" do
	  @browser.find_element(:id,"credits1").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal(@site+"#credits", @browser.current_url)
   end
   
   it "I can see credits page" do
	  element = @browser.find_element(:id,"credits").find_element(:xpath,'.//*[contains(.,"Design by")]').text
	  assert_equal("Design by", element[0,9])
   end

   it "I can access ULL page" do
	  @browser.find_element(:id,"ULL").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal("http://www.ull.es/", @browser.current_url)
   end
   
   it "I can access ETSII page" do
	  @browser.find_element(:id,"ETSII").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal("http://www.ull.es/view/centros/etsii/Inicio/es", @browser.current_url)
   end

   it "I can access AaronS page" do
	  @browser.find_element(:id,"aa1").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal("http://alu0100207385.github.io/", @browser.current_url)
   end
   
   it "I can access AaronV page" do
	  @browser.find_element(:id,"aa2").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal("https://github.com/alu0100537451", @browser.current_url)
   end

   it "I can access Repository's help page" do
	  @browser.find_element(:id,"help2").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal("https://github.com/alu0100207385/SYTW_p6/issues/2", @browser.current_url)
   end
   
   it "I can access Index page across Help page" do
	  @browser.find_element(:id,"help").click
	  @browser.manage.timeouts.implicit_wait = 3
	  @browser.find_element(:id,"index").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal(@site, @browser.current_url)
   end
   
end

describe "Test Chat App: Comprobacion de control" do

end

describe "Test Chat App: Funcionalidades" do
end