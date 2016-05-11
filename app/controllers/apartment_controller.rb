class ApartmentController < ApplicationController

  get '/apartments' do 
    if logged_in?
      @apartments = Apartment.all
      erb :'apartments/index'    
    else
      redirect to '/login'
    end
  end

  get '/apartments/new' do
    if logged_in?
      erb :'apartments/new'
    else
      redirect '/login'
    end
  end

  post '/apartments' do
    if req_params
      @apartment = Apartment.find_or_create_by(apt_params)
      redirect "/apartments/#{@apartment.id}"
    else
      redirect '/apartments/new'
    end
  end

  get '/apartments/:id' do
    if logged_in?
      @apartment = Apartment.find_by(id: params[:id])
      erb :'apartments/show'
    else
      redirect '/login'
    end
  end

  private

  def req_params
    params[:address1] != "" && params[:city] != "" && params[:country] != "" && params[:postal_code] != ""
  end

  def apt_params
    {address1: params[:address1], address2: params[:address2], city: params[:city], state: params[:state], country: params[:country], postal_code: params[:postal_code].gsub(" ","")}
  end

end