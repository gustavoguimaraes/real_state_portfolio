class CreateOpenHouses < ActiveRecord::Migration
  def change
    create_table :open_houses do |t|
      t.datetime  :start_time
      t.datetime  :end_time
      t.integer   :listing_id
      t.timestamps
    end
  end
end
