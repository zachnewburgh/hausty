class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.integer :street_number
      t.string :street_name
      t.string :apartment_number
      t.string :city
      t.string :state 
      t.string :country
      t.string :postal_code
    end
  end
end
