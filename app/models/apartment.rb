class Apartment < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  # def rating
  #   rating_sum = 0
  #   rating_count = 0
  #   Apartment.find_by(id: params[:id]).reviews.each do |review|
  #     rating_sum += review.rating.to_i
  #     rating_count += 1
  #   end
  #   rating_avg = rating_sum/rating_count
  # end

  def address
    if state!= ""
      "#{address1}, " + "#{city}, " + "#{state}, " + "#{country}, " + "#{postal_code}"
    else
      "#{address1}, " + "#{city}, " + "#{country}, " + "#{postal_code}"
    end
  end
end