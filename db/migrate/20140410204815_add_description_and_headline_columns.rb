class AddDescriptionAndHeadlineColumns < ActiveRecord::Migration
  def change
    add_column :listings, :listing_page_headline, :string
    add_column :listings, :listing_page_description, :text
  end
end
