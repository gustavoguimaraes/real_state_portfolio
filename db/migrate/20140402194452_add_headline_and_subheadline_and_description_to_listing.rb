class AddHeadlineAndSubheadlineAndDescriptionToListing < ActiveRecord::Migration
  def change
    add_column :listings, :headline, :string
    add_column :listings, :sub_headline, :string
    add_column :listings, :description, :text
  end
end
