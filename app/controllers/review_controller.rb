class ReviewController < ApplicationController

  get '/reviews' do 
    if session[:user_id]
      @reviews = Review.all
      erb :'reviews/reviews'    
    else
      redirect to '/login'
    end
  end

  get '/reviews/new' do
    erb :'reviews/submit_review'
  end

  post '/reviews' do
    if params[:title] != "" && params[:content] != "" && params[:rating] != ""
      @review = Review.new(title: params[:title], content: params[:content], rating: params[:rating], user_id: session[:user_id])
      @review.save
      erb :'reviews/show_review'
    else
      redirect '/reviews/new'
    end
  end

  get '/reviews/:id' do 
    if !session[:user_id]
      redirect '/login'
    else
      @review = Review.find_by(id: params[:id])
      erb :'reviews/show_review'
    end
  end
end