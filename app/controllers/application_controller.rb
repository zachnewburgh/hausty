require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "hausty_secret"    
  end

  get '/' do
    erb :home
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end
  end

end