class AddShowPageFieldsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :show_headline, :string
    add_column :properties, :show_subheadline, :string
    add_column :properties, :show_description, :text
  end
end
