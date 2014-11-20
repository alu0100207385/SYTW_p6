# -*- coding: utf-8 -*-
require 'coveralls'
Coveralls.wear!
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

   it "##1. I can access index page" do
	  assert_equal(@site, @browser.current_url)
   end
   
   it "##2. I can see index page" do
	  element = @browser.find_element(:id,"title").text
	  assert_equal("Bienvenido a nuestro chat", element)
   end
   
   it "##3. I can access top page" do
	  @browser.find_element(:id,"top").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal(@site+"#", @browser.current_url)
   end

   it "##4. I can access repository page" do
	  @browser.find_element(:id,"repository").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal("https://github.com/alu0100207385/SYTW_p6", @browser.current_url)
   end

   it "##5. I can access rules page" do
	  @browser.find_element(:id,"rules1").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal(@site+"#rules", @browser.current_url)
   end

   it "##6. I can see rules page" do
	  element = @browser.find_element(:id,"rules").find_element(:xpath,'.//*[contains(.,"las normas")]').text
	  assert_equal("RULES CHAT", element[0,10])
   end

   it "##7. I can access help page" do
	  @browser.find_element(:id,"help").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal(@site+"help", @browser.current_url)
   end
   
   it "##8. I can see help page" do
	  @browser.find_element(:id,"help").click
	  @browser.manage.timeouts.implicit_wait = 3
	  element = @browser.find_element(:id,"title").find_element(:xpath,'.//*[contains(.,"FRECUENTES")]').text
	  assert_equal("PROBLEMAS FRECUENTES", element)
   end

   it "##9. I can access credits page" do
	  @browser.find_element(:id,"credits1").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal(@site+"#credits", @browser.current_url)
   end
   
   it "##10. I can see credits page" do
	  element = @browser.find_element(:id,"credits").find_element(:xpath,'.//*[contains(.,"Design by")]').text
	  assert_equal("Design by", element[0,9])
   end

   it "##11. I can access ULL page" do
	  @browser.find_element(:id,"ULL").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal("http://www.ull.es/", @browser.current_url)
   end
   
   it "##12. I can access ETSII page" do
	  @browser.find_element(:id,"ETSII").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal("http://www.ull.es/view/centros/etsii/Inicio/es", @browser.current_url)
   end

   it "##13. I can access AaronS page" do
	  @browser.find_element(:id,"aa1").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal("http://alu0100207385.github.io/", @browser.current_url)
   end
   
   it "##14. I can access AaronV page" do
	  @browser.find_element(:id,"aa2").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal("https://github.com/alu0100537451", @browser.current_url)
   end

   it "##15. I can access Repository's help page" do
	  @browser.find_element(:id,"help2").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal("https://github.com/alu0100207385/SYTW_p6/issues/2", @browser.current_url)
   end
   
   it "##16. I can access Index page across Help page" do
	  @browser.find_element(:id,"help").click
	  @browser.manage.timeouts.implicit_wait = 3
	  @browser.find_element(:id,"index").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal(@site, @browser.current_url)
   end
   
   it "##17. I can access Contact page across Help page" do
	  @browser.find_element(:id,"help").click
	  @browser.manage.timeouts.implicit_wait = 3
	  @browser.find_element(:id,"contact").click
	  @browser.manage.timeouts.implicit_wait = 3
	  assert_equal("https://github.com/alu0100207385/SYTW_p6/issues/2", @browser.current_url)
   end
end


describe "Test Chat App: Comprobacion de control" do
   
   before :all do
	  @browser = Selenium::WebDriver.for :firefox
	  @site = 'http://sytw6.herokuapp.com/'
	  if (ARGV[0].to_s == "local")
		 @site = 'http://localhost:4567/'
	  end
	  @browser.get(@site)
	  @browser.manage().window().maximize()
	  @browser.manage.timeouts.implicit_wait = 5
   end

   after :all do
	  @browser.quit
   end

   #Ruta invalida
   it "##1. I cannot access chat page without login" do
	  @browser.get(@site+"chat")
	  @browser.manage.timeouts.implicit_wait = 2
	  assert_equal(@site+"auth/failure", @browser.current_url)
   end
   
   #Introduciendo cadena invalida
   it "##2. I can access chat page without a valid nickname" do
	  @browser.find_element(:id,"nickname").send_keys("")
	  @browser.manage.timeouts.implicit_wait = 2
	  @browser.find_element(:id,"enter").click
	  @browser.manage.timeouts.implicit_wait = 2
	  element = @browser.find_element(:id,"warning-message").text
	  assert_equal("Nickname inválido. Pruebe con otro.", element)
   end

   #Introduciendo un usuario sin error
   it "##3. I can access chat page with a valid nickname" do
	  @browser.find_element(:id,"nickname").send_keys("Usuario")
	  @browser.manage.timeouts.implicit_wait = 2
	  @browser.find_element(:id,"enter").click
	  @browser.manage.timeouts.implicit_wait = 2
	  element = @browser.find_element(:id,"bsend").displayed?
	  @browser.find_element(:id,"exit").click
	  assert_equal(true, element)
   end
   
   #Introduciendo usuario ya logueado
   it "##4. I cannot access chat page if a nickname is in use" do
	  @browser.find_element(:id,"nickname").send_keys("Usuario2")
	  @browser.manage.timeouts.implicit_wait = 2
	  @browser.find_element(:id,"enter").click
	  @browser.manage.timeouts.implicit_wait = 2
	  body = @browser.find_element(:tag_name => 'body')
	  body.send_keys(:control, 't')
	  @browser.get(@site)
	  @browser.manage.timeouts.implicit_wait = 5
	  @browser.find_element(:id,"nickname").send_keys("Usuario2")
	  @browser.manage.timeouts.implicit_wait = 2
	  @browser.find_element(:id,"enter").click
	  @browser.manage.timeouts.implicit_wait = 2
	  element = @browser.find_element(:id,"warning-message").text
	  body = @browser.find_element(:tag_name => 'body')
	  body.send_keys(:control, 'w')
	  @browser.manage.timeouts.implicit_wait = 2
	  @browser.find_element(:id,"exit").click
	  assert_equal("Ese nick esta en uso. Elija otro.", element)
   end

   #Introduciendo usuario y desloguear
   it "##5. I can access chat page with a valid nickname" do
	  @browser.find_element(:id,"nickname").send_keys("Usuario3")
	  @browser.manage.timeouts.implicit_wait = 2
	  @browser.find_element(:id,"enter").click
	  @browser.manage.timeouts.implicit_wait = 2
	  @browser.find_element(:id,"exit").click
	  assert_equal(@site, @browser.current_url)
   end
end


describe "Test Chat App: Funcionalidades" do
   
   before :all do
	  @browser = Selenium::WebDriver.for :firefox
	  @site = 'http://sytw6.herokuapp.com/'
	  if (ARGV[0].to_s == "local")
		 @site = 'http://localhost:4567/'
	  end
	  @browser.get(@site)
	  @browser.manage().window().maximize()
	  @browser.manage.timeouts.implicit_wait = 5
   end

   after :all do
	  @browser.quit
   end

   it "##1. I am a user logged" do
	  @browser.find_element(:id,"nickname").send_keys("Usuario4")
	  @browser.manage.timeouts.implicit_wait = 2
	  @browser.find_element(:id,"enter").click
	  @browser.manage.timeouts.implicit_wait = 2
	  element = @browser.find_element(:id,"listado").text
	  @browser.find_element(:id,"exit").click
	  assert_equal("Usuario4", element)
   end

   #Introducir cadena y leerla
   it "##2. Write and send messages" do
	  @browser.find_element(:id,"nickname").send_keys("Usuario5")
	  @browser.manage.timeouts.implicit_wait = 3
	  @browser.find_element(:id,"enter").click
	  @browser.manage.timeouts.implicit_wait = 5
	  @browser.find_element(:id,"text").send_keys("Selenium es util para las pruebas")
	  sleep(3)
	  @browser.find_element(:id => "bsend").click
	  sleep(3)
	  element = @browser.find_element(:id => "chat").text
	  @browser.manage.timeouts.implicit_wait = 3
	  @browser.find_element(:id,"exit").click
	  assert_equal("Bienvenido..\nUsuario5 : Selenium es util para las pruebas", element)
   end
end