class Image < ActiveRecord::Base
  belongs_to :listing
  acts_as_list scope: :listing

  has_attached_file :gallery_image,
    styles: {
      lightbox: "500x500>",
      medium: "375x375>",
      thumb: "250x250>"
    }

  validates_attachment_content_type :gallery_image, content_type: /\Aimage\/.*\Z/
  validates :gallery_image, presence: true

  def self.sorted
    order(:position)
  end

end
