class CreatePropertiesTable < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :headline
      t.string :subheadline
      t.text :description
      t.integer :price
      t.string :code
      t.string :email
      t.string :property_type
    end
  end
end
