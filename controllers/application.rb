class ApplicationController < Sinatra::Base
  require 'bundler'
  Bundler.require

  ActiveRecord::Base.establish_connection(
  :database => 'shopping_list',
  :adapter => 'postgresql'
)

set :views, File.expand_path('../../views', __FILE__)

# not_found do
#  erb :not_found
# end


enable :sessions

def does_user_exist(username)
  user = Account.find_by(:user_name => username)
  if user
    return true
  else
    return false
  end
end

def authorization_check
  if session[:current_user] == nil
    redirect '/not_authorized'
    return false
  else
    return true
  end
end

get '/' do
  authorization_check
  @user_name = session[:current_user].user_name
  erb :index
end

get '/not_authorized' do
  erb :not_authorized
end

get '/register' do
  erb :register
end

post '/register' do
  p params
  if does_user_exist(params[:user_name]) == true
    return {:message => "User exists"}.to_json
  end
  user = Account.create(user_email: params[:user_email], user_name: params[:user_name],
  password: params[:password])

  p user

  session[:current_user] = user

  redirect '/'
end

get '/login' do
  erb:login
end

post '/login' do
  authorization_check
  user = Account.authenticate(params[:user_name], params[:password])
  if user
    session[:current_user] = user
    redirect '/'
  else
    @message = "password or user name incorrect"

  end
end

get '/logout' do
  authorization_check
  session[:current_user] = nil
  redirect '/'
end

end
