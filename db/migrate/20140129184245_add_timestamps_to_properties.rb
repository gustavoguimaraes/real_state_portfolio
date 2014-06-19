class AddTimestampsToProperties < ActiveRecord::Migration
  def change
    change_table :properties do |t|
      t.timestamps
    end
  end
end
