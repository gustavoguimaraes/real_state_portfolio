class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :code
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
