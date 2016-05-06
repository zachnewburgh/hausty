require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "hausty_secret"
  end

helpers do

  def logged_out?
		if !logged_in?
			redirect '/login'
		end
	end

	def logged_in?
		!!current_user
	end

	def current_user
		@current_user ||= User.find(session[:id]) if session[:id]
	end

end

  get '/' do
    erb :home
  end

end
