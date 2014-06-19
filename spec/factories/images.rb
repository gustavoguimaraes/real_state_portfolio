# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
    gallery_image_file_name "fake image.jpg"
    gallery_image_content_type "image/jpg"
    gallery_image_file_size 1
    gallery_image_updated_at { Time.now }
  end
end
