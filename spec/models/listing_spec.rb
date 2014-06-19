require 'spec_helper'

describe Listing do
  let(:listing) { Listing.new }

  describe "validations" do
    it "requires a listing type" do
      expect(listing.valid?).to eq(false)
      expect(listing.errors[:listing_type].count).to be > 0
    end

    it "requires a valid listing type" do
      listing.listing_type = "town house in boston"
      expect(listing.valid?).to eq(false)
      expect(listing.errors[:listing_type].count).to be > 0
    end

    it "requires a code" do
      expect(listing.valid?).to eq(false)
      expect(listing.errors[:code].count).to eq(1)
    end

    it "requires a unique code" do
      FactoryGirl.create(:listing, code: "H-1234")
      listing.code = "H-1234"
      listing.listing_type = "House"
      expect(listing.valid?).to eq(false)
      expect(listing.errors[:code].count).to eq(1)
    end

    it "requires a headline" do
      expect(listing.valid?).to eq(false)
      expect(listing.errors[:headline].count).to eq(1)
    end

    it "requires a description" do
      expect(listing.valid?).to eq(false)
      expect(listing.errors[:description].count).to eq(1)
    end

    it "requires a headline image" do
      expect(listing.valid?).to eq(false)
      expect(listing.errors[:headline_image].count).to eq(1)
    end

  end

  context "when generating a code" do
    let(:listing) { FactoryGirl.build(:listing, listing_type: "House") }
    before do
      @l1 = FactoryGirl.create(:listing, listing_type: "House", code: "H-1234")
      @l2 = FactoryGirl.create(:listing, listing_type: "Condo", code: "C-4321")
      @latest = @l2.id

    end
    it "can generate a code" do
      expect(listing.generate_code).to eq("H-#{@latest + 1}")
      listing.listing_type = "Condo"
      expect(listing.generate_code).to eq("C-#{@latest + 1}")
    end
    it "generates automatically when no code entered" do
      listing.code = nil
      listing.save
      listing.reload
      expect(listing.code).to eq("H-#{@latest + 1}")
    end
    it "handles a collision" do
      code = listing.generate_code
      @l2.code = code
      @l2.save
      listing.save
      expect(listing.persisted?).to eq(true)
    end
  end

  context "when retrieving by listing type" do

    describe ".houses" do
      let!(:house) { FactoryGirl.create(:house) }
      it "contains listings of all houses" do
        FactoryGirl.create(:condo)
        expect(Listing.houses).to eq([house])
      end

      it "has most recently updated houses first" do
        newest = FactoryGirl.create(:house, updated_at: Time.now + 1.day)
        expect(Listing.houses.first).to eq(newest)
      end
    end

    describe ".condos_and_coops" do
      it "contains listings of all coop and condos" do
        condo = FactoryGirl.create(:condo)
        coop = FactoryGirl.create(:coop)
        FactoryGirl.create(:house)
        expect(Listing.condos_and_coops).to include(coop, condo)
        expect(Listing.condos_and_coops.count).to eq(2)
      end

      it "has most recently updated coops or condo first" do
        FactoryGirl.create(:coop)
        newest = FactoryGirl.create(:condo, updated_at: Time.now + 1.day)
        expect(Listing.condos_and_coops.first).to eq(newest)
      end
    end

    describe ".rentals" do
      it "contains listings of all rentals" do
        rental = FactoryGirl.create(:rental)
        FactoryGirl.create(:house)
        expect(Listing.rentals).to eq([rental])
      end

      it "has most recently updated rentals first" do
        FactoryGirl.create(:rental)
        newest = FactoryGirl.create(:rental, updated_at: Time.now + 1.day)
        expect(Listing.rentals.first).to eq(newest)
      end
    end

    describe ".sales" do
      it "contains listings of all sales" do
        house = FactoryGirl.create(:house)
        coop = FactoryGirl.create(:coop)
        condo = FactoryGirl.create(:condo)
        FactoryGirl.create(:rental)
        expect(Listing.sales).to include(house,coop,condo)
        expect(Listing.sales.count).to eq(3)
      end
    end

  end
end
