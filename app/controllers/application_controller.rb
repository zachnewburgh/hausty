require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "hausty_secret"    
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :'users/create_user'
  end

  post '/signup' do
    if params[:first_name] == "" || params[:last_name] == "" || params[:email] == "" || params[:username] == "" || params[:password] == "" 
      redirect '/signup'
    else
      @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], username: params[:username], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      erb :'reviews/reviews'
    end
  end
  
end