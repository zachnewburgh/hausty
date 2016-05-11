require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "hausty_secret" 
    use Rack::Flash  
  end

  get '/' do
    erb :home
  end

  helpers do
    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find_by(id: session[:id])
    end
  end

end