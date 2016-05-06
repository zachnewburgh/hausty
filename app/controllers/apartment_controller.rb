class ApartmentController < ApplicationController

  get '/apartments' do 
    if logged_in?
      @apartments = Apartment.all
      erb :'apartments/apartments'    
    else
      redirect to '/login'
    end
  end

  get '/apartments/new' do
    if logged_in?
      erb :'apartment/list_apartment'
    else
      redirect '/login'
    end
  end

  post '/apartments' do
    if params[:street_number] != "" && params[:street_name] != "" && params[:city] != "" && params[:state] != "" && params[:country] != "" && params[:postal_code] != ""
      @apartment = Apartment.new(street_number: params[:street_number], street_name: params[:street_name], city: params[:city], state: params[:state], country: params[:country], postal_code: params[:postal_code])
      @apartment.save
      erb :'apartments/show_apartment'
    else
      redirect '/apartments/new'
    end
  end

  get '/apartment/:id' do
    if logged_in?
      @apartment = Apartment.find_by(id: params[:id])
      erb :'apartments/show_apartment'
    else
      redirect '/login'
    end
  end

end