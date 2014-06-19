class Listing < ActiveRecord::Base

  belongs_to :neighborhood

  LISTING_TYPES = ["House", "Condo", "Co-op", "Rental House", "Rental Apartment"]
  STATUSES = ["Available", "In Contract", "Rented", "Sold"]

  has_many :images
  has_many :open_houses
  belongs_to :user

  has_attached_file :headline_image, {
    styles: {
      listing: "300x300>",
      lead: "360x360>",
      thumb: "200x200>"
    },
    default_url: "/images/:class/:style.png"
  }

  validates_attachment_content_type :headline_image, content_type: /\Aimage\/.*\Z/
  validates :headline_image, presence: true

  validates :listing_type, presence: true
  validates :listing_type, inclusion: { in: LISTING_TYPES }
  validates :headline, presence: true
  validates :description, presence: true
  validates :listing_page_headline, presence: true
  validates :listing_page_description, presence: true
  validates :code, presence: true
  validates :code, uniqueness: true
  validates :status, presence: true

  before_validation :check_code

  def to_param
    code
  end

  def rental?
    return true if self.listing_type == "Rental House" || self.listing_type == "Rental Apartment"
  end

  def sale?
    return true if self.listing_type == "House" || self.listing_type == "Condo" || self.listing_type == "Coop"
  end

  def ispublished?
    self.publish
  end

  def self.condos_and_coops
    where(listing_type: ["Condo", "Co-op"]).published?.order(updated_at: :desc)
  end

  def self.rentals
    where(listing_type: ["Rental House", "Rental Apartment" ]).published?.order(updated_at: :desc)
  end

  def self.houses
      where(listing_type:"House").published?.order(updated_at: :desc)
  end

  def self.sales
    where(listing_type: ["House", "Condo", "Co-op"])
  end

  def self.published?
    where(publish: true)
  end

  def self.unpublished?
    where(publish: false)
  end

  def self.statuses
    STATUSES
  end

  def self.listing_types
    LISTING_TYPES
  end

  def self.publish_options
    PUBLISH_OPTIONS
  end

  def check_code
    return if self.code.present?
    self.code = generate_code
    while Listing.find_by(code: self.code)
      self.code = randomize_code
    end
  end

  def randomize_code
    return nil if self.listing_type.blank?
    "#{self.listing_type[0]}-#{[*0..10000].sample}R"
  end

  def generate_code
    return nil if self.listing_type.blank?
    letter = self.listing_type[0]
    latest_code = Listing.maximum(:id) || 0
    "#{letter}-#{latest_code + 1}"
  end

  def display_name
    code
  end
end
