task :default => :tests

desc "run the chat server"
task :server do
  sh "bundle exec ruby chat.rb"
end

desc "Run the server via Sinatra"
task :sinatra do
  sh "ruby chat.rb"
end

desc "Run the server via rackup"
task :rackup do
  sh "rackup"
end

desc "make a non Ajax request via curl"
task :noajax do
  sh "curl -v http://localhost:4567/update"
end

desc "make an Ajax request via curl"
task :ajax do
  sh %q{curl -v -H "X-Requested-With: XMLHttpRequest" localhost:4567/update}
end

desc "Open app in Heroku"
task :heroku do
   sh "heroku open"
end

desc "Run tests (default)"
task :tests do
   sh "ruby test/test.rb"
end

desc "Run tests in local machine"
task :local_tests do
   sh "gnome-terminal -x sh -c 'ruby chat.rb' && sh -c 'ruby test/test.rb local'"
end

desc "Open repository"
task :repo do
  sh "gnome-open https://github.com/alu0100207385/sytw_p6"
end
