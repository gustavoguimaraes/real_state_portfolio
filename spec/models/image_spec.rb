require 'spec_helper'

describe Image do

  describe "validations" do
    it "it requires an image" do
      image = Image.new
      expect(image).to_not be_valid
      expect(image.errors[:gallery_image].count).to be > 0
    end
  end

end
