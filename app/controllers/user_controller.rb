class UserController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/new'
    else
      redirect '/apartments'
    end
  end

  post '/signup' do
    if params[:first_name] == "" || params[:last_name] == "" || params[:email] == "" || params[:username] == "" || params[:password] == "" 
      flash[:notice] = "=> Field left blank, try again!"
      redirect '/signup'
    else
      @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], username: params[:username], password: params[:password])
      @user.save
      session[:id] = @user.id
      redirect '/apartments'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/apartments'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect '/apartments'
    else
      redirect '/signup'
    end
  end

  get '/logout' do 
    if logged_in?
      session.destroy
      redirect '/login'
    else
      redirect to '/'
    end
  end
  
end