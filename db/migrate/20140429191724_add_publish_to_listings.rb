class AddPublishToListings < ActiveRecord::Migration
  def change
    add_column :listings, :publish, :string
  end
end
