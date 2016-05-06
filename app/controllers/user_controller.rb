require 'pry'
class UserController < ApplicationController


  get '/signup' do
    if logged_in?
      redirect to '/reviews'
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    if params.values.include?("")
      redirect to '/signup'
    else
      @user = User.create(params)
      session[:id] = @user.id
      redirect '/reviews'
    end
  end

  get '/login' do
    binding.pry
    if logged_in?
      redirect to '/reviews'
    else
       erb :'users/login'
    end
  end

  post '/login' do
    if params.values.include?("")
      redirect "/login"
    else
      @user = User.find_by(:username => params[:username])
      if @user && @user.authenticate(params[:password])
        session[:id] = @user.id
        binding.pry
        redirect "/reviews"
      else
        redirect "/signup"
      end
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
    end
    redirect '/login'
  end

end
