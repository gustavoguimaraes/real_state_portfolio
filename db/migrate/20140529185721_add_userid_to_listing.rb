class AddUseridToListing < ActiveRecord::Migration
  def change
    add_column :listings, :user_id, :string
  end
end
