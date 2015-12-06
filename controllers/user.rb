class UserController < ApplicationController
  get '/' do
    erb :index
  end

  get '/home' do
    authorization_check
    @user_name = session[:current_user].user_name
    erb :home
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

    redirect '/home'
  end

  get '/login' do
    erb:login
  end

  post '/login' do
    user = Account.authenticate(params[:user_name], params[:password])
    if user
      session[:current_user] = user
      redirect '/home'
    else
      @message = "Password or Username incorrect, please try again."
      erb :login
    end
  end

  get '/logout' do
    authorization_check
    session[:current_user] = nil
    redirect '/'
  end


end
