require 'sinatra'
require 'sinatra/flash'
require 'sinatra/reloader' if development?
#set :port, 3000
# set :environment, :production, :development

MAX = 20 #Usuarios maximos en la sala de chat

chat = ['Bienvenido..']

users_color =['#F7FE2E','#A9F5A9','#58ACFA','#3A01DF','#610B5E','#DF3A01','#3B170B','#01DFD7','#FE2EC8','#FA5858',
                  '#BF00FF','#585858','#B18904','#9FF781','#FF0040','#F6CECE','#585858','#0B0B3B','#1C1C1C','#F4FA58']
enable :sessions
set :session_secret, '*&(^#234a)'

users_on = Array.new
nickname = String.new
control = 0

get('/') do
   puts "usuarios ===== #{users_on}"
   puts "control ===== #{control}"
   erb :index
end

get '/chat' do
   nick = params[:nick]
   if (nick == "")
	  @control = control = 3
	  erb :index
# 	  redirect '/'
   elsif (users_on.include? nick)
	  @control = control = 1
	  erb :index
# 	  flash[:notice] = %Q{<h3>Ese nick esta en uso. Elija otro.</h3> &#60; <a href="/">Volver</a> }
	elsif (users_on.length == MAX)
	  @control = control = 2
	  erb :index
# 	  flash[:notice] = %Q{<h3>La sala de chat esta llena. Vuelva a intentarlo mas tarde.</h3> &#60; <a href="/">Volver</a> } 
   else
	  nickname = nick
	  users_on << nick
	  session[:nickname] = nickname
	  control = 0
	  puts "usuarios ===== #{users_on}"
	  puts "control ===== #{control}"
	  erb :chat
   end
end

get '/logout' do
#    @users_on.find_index (@nick)
   nickname = session[:nickname]
   users_on.delete (nickname)
   session.clear
   control = 0
   redirect '/'
end


get '/help' do
    erb :help
end

get '/send' do
  return [404, {}, "Not an ajax request"] unless request.xhr?
  chat << "#{request.ip} : #{params['text']}"
  nil
end

get '/update' do
  return [404, {}, "Not an ajax request"] unless request.xhr?
  @updates = chat[params['last'].to_i..-1] || []

  @last = chat.size
  erb <<-'HTML', :layout => false
      <% @updates.each do |phrase| %>
        <%= phrase %> <br />
      <% end %>
      <span data-last="<%= @last %>"></span>
  HTML
end

get '/auth/failure' do
  flash[:notice] =
    %Q{<h3>Error de ruta</h3> &#60; <a href="/">Volver</a> }
end
