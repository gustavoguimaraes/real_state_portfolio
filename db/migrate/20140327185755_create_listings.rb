class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :code
      t.string :listing_type

      t.timestamps
    end

    add_index :listings, :code, { unique: true }
  end
end
