class PropertyHeadlineImage < ActiveRecord::Migration
  def self.up
    add_attachment :properties, :headline_image
  end

  def self.down
    remove_attachment :properties, :headline_image
  end
end
