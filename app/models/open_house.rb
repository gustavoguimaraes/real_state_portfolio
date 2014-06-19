class OpenHouse < ActiveRecord::Base
  belongs_to :listing

  just_define_datetime_picker :start_time
  just_define_datetime_picker :end_time

  validates :start_time, presence: true
  validates :end_time, presence: true

  def self.upcoming
    current_thursday = Chronic.parse("thursday").beginning_of_day
    today = Time.now.beginning_of_day

    where('start_time >= ?', today).where('end_time < ?', current_thursday)
  end

  def human_start_time
    start_time.strftime("%A %B %d, %Y %I:%M%p")
  end

  def human_end_time
    end_time.strftime("%A %B %d, %Y %I:%M%p")
  end

  def lead_page_time
    "#{start_time.strftime("%A, %B %d %I:%M%p")} - #{self.end_time.strftime("%I:%M%p")}"
  end

  def published_listing
    listing.publish == true
  end
end