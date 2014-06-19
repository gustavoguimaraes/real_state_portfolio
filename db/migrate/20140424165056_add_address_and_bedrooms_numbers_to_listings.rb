class AddAddressAndBedroomsNumbersToListings < ActiveRecord::Migration
  def change
    add_column :listings, :street_address, :string
    add_column :listings, :cross_streets, :string
    add_column :listings, :city, :string
    add_column :listings, :state, :string
    add_column :listings, :zipcode, :integer
    add_column :listings, :bedrooms, :float
  end
end
