require 'spec_helper'

describe OpenHouse do

  describe ".upcoming" do

    before { Timecop.freeze(time) }
    after { Timecop.return }

    let(:time) { Time.local(2014, 5, 7, 10, 0, 0) } #wednesday

    it "includes open houses from today to this thursday" do
      yesterday = FactoryGirl.create(:open_house, start_time: 1.day.ago, end_time: 1.day.ago)
      today = FactoryGirl.create(:open_house)
      tomorrow = FactoryGirl.create(:open_house, start_time: 1.day.from_now, end_time: 1.day.from_now )

      expect(OpenHouse.upcoming).to include(today)
      expect(OpenHouse.upcoming).to_not include(yesterday, tomorrow)
    end

    it "doesn't include an open house the day after its over" do
      FactoryGirl.create(:open_house, start_time: 1.day.ago, end_time: 1.day.ago)
      expect(OpenHouse.upcoming).to be_empty
    end

    it "doesn't include an open house scheduled a week from thursday" do
      next_thursday = FactoryGirl.create(:open_house, start_time: 8.days.from_now, end_time: 8.days.from_now)
      expect(OpenHouse.upcoming).to_not include(next_thursday)
    end

  end
end