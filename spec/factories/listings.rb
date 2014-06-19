FactoryGirl.define do
  factory :listing, aliases: [:house] do
    status "Available"
    publish true
    listing_type "House"
    description "Look at this pretty house! Organic, mug, beans kopi-luwak grounds mug id robust. Extraction aromatic, caramelization, medium, shop, café au lait at doppio body aromatic medium saucer. To go irish, aroma, extraction id crema dark bar con panna mazagran. Crema macchiato and est, seasonal, pumpkin spice robust brewed extraction fair trade. Robust a acerbic bar single shot cream aftertaste. Con panna sit redeye, so robusta affogato aroma grinder. Medium, café au lait caramelization extraction bar as cortado irish. Coffee half and half french press eu doppio carajillo, espresso, aftertaste doppio irish mocha percolator."
    headline "AMAZING BEST PRETTY HOUSE FOR FREE"
    listing_page_headline "12 waterfalls in this house"
    listing_page_description "This house is made from rainbows and marshmallows!"
    sub_headline "You would look good here"
    cross_streets "Hannah Way and Gus Drive"
    street_address "123 Sesame Street"
    price "$1,000,000"

    # fake the headline image use the
    headline_image_file_name "assets/sample_listing.jpg"
    headline_image_content_type "image/jpg"
    headline_image_file_size 1
    headline_image_updated_at { Time.now }

    factory :condo do
      listing_type "Condo"
    end
    factory :coop do
      listing_type "Co-op"
    end

    factory :rental do
      listing_type "Rental House"
    end

    factory :open_house_sales do
      after(:create) do |listing|
        create(:open_house, listing: listing)
      end
    end

    factory :house_with_images do
      headline "House with Image"
    end
  end
end
