class AddDefaultPublishToListings < ActiveRecord::Migration
  def change
    remove_column :listings, :publish, :string
    add_column :listings, :publish, :boolean, default: true
  end
end
