class AddGalleryImageToImages < ActiveRecord::Migration
  def up
    add_attachment :images, :gallery_image
  end

  def down
    remove_attachment :images, :gallery_image
  end
end

