class ReviewController < ApplicationController

  # get '/reviews' do 
  #   if logged_in?
  #     @reviews = Review.all
  #     erb :'reviews/reviews'  
  #   else
  #     redirect to '/login'
  #   end
  # end

  # get '/reviews/new' do
  #   if logged_in?
  #     erb :'reviews/submit_review'
  #   else
  #     redirect '/login'
  #   end
  # end

  # post '/reviews' do
  #   if params[:title] != "" && params[:content] != "" && params[:rating] != ""
  #     @review = Review.new(title: params[:title], content: params[:content], rating: params[:rating], user_id: session[:id], apartment_id: @apartment.id)
  #     @review.save
  #     erb :'apartments/show_apartment'
  #   else
  #     redirect '/apartments'
  #   end
  # end

  get '/reviews/:id' do 
    if !logged_in?
      redirect '/login'
    else
      @review = Review.find_by(id: params[:id])
      erb :'reviews/show_review'
    end
  end

  get '/reviews/:id/edit' do 
    if !logged_in?
      redirect '/login'
    else
      @review = Review.find_by(id: params[:id])
      erb :'reviews/edit_review'
    end
  end

  patch '/reviews/:id' do
    @review = Review.find_by(id: params[:id])
    if params[:title] != "" && params[:content] != "" && params[:rating] != ""
      @review.title = params[:title]
      @review.content = params[:content]
      @review.rating = params[:rating]
      @review.save
      redirect "/reviews/#{@review.id}"
    else
      redirect "/reviews/#{@review.id}/edit"
    end
  end

  delete '/reviews/:id/delete' do
    @review = Review.find_by(id: params[:id])
    if logged_in?
      @review = Review.find_by(id: params[:id])
      if @review.user_id == session[:id]
        @review.delete
        redirect '/reviews'
      else
        redirect '/reviews'
      end
    else
      redirect '/login'
    end
  end
  
end