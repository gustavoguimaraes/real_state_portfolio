class AddHeadlineImagesToListings < ActiveRecord::Migration
  def up
    add_attachment :listings, :headline_image
  end

  def down
    remove_attachment :listings, :headline_image
  end
end
