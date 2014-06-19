FactoryGirl.define do
  factory :open_house do
    start_time { Time.now }
    end_time { Time.now }
  end
end