class AddHeadlineToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :headline, :string
  end
end
