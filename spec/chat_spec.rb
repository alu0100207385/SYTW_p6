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
   
	def app
	  Sinatra::Application
	end
   
	it "Acceso a index" do
	  get '/'
	  expect(last_response).to be_ok
   end

	it "Acceso a las normas" do
	  get '/#rules'
	  expect(last_response).to be_ok
   end
   
   it "Acceso a los creditos" do
	  get '/#credits'
	  expect(last_response).to be_ok
   end
   
   it "Acceso a login" do
	  get '/#login'
	  expect(last_response).to be_ok
   end
   
   it "Acceso a cerrar sesion" do
	  get '/logout'
	  expect(last_response.body).to eq("")
   end
   
   it "Acceso a la ayuda" do
	  get '/help'
	  expect(last_response).to be_ok
   end
   
   it "Acceso a: ruta erronea" do
	  get '/auth/failure'
	  expect(last_response).to be_ok
   end
   
   it "Acceso a send" do
	  get '/send'
	  expect(last_response.body).to eq("Not an ajax request")
   end
   
   it "Acceso a update" do
	  get '/update'
	  expect(last_response.body).to eq("Not an ajax request")
   end
   

   it "Podemos enviar: post" do
	  post '/login' , :nick => "Usuario"
	  expect(last_response.body).to eq("")
   end
   
   it "Podemos enviar: post" do
	  post '/login' , :nick => ""
	  expect(last_response).to be_ok
   end

   it "Podemos enviar: post" do
	  post '/login' , :nick => "Usuario"
	  expect(last_response).to be_ok
   end
   
   it "Podemos enviar: post" do
	  get '/chat'
	  expect(last_response.body).to eq("")
   end
   
   it "Actualizamos los usuarios" do
	  get '/update_users'
	  expect(last_response.body).to eq("Not an ajax request")
   end

   
end