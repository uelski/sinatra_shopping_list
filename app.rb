require 'bundler'
Bundler.require

get '/' do
  erb :home
end

get '/login' do
  erb :login
end

get '/registration' do
  erb :registration
end

get '/users' do
  erb :users
end

get '/items' do
  erb :items
end
