ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
  # div :class => "blank_slate_container", :id => "dashboard_default_message" do
  #   span :class => "blank_slate" do
      columns do
        column do
          panel "Available Sales" do
            table_for Listing.published?.sales.where(status: "Available").limit(10).each do |listing|
              column ("code") {|listing| link_to Listing.find_by(id: listing.id).code, admin_listing_path(Listing.find_by(id: listing.id))}
              column :headline
              column :listing_type
              column :bedrooms
              column :neighborhood
              column :city
            end
          end
        end
        column do
           panel "Available Rental" do
            table_for Listing.rentals.order('created_at desc').limit(10).each do |listing|
              column ("code") {|listing| link_to Listing.find_by(id: listing.id).code, admin_listing_path(Listing.find_by(id: listing.id))}
              column :headline
              column :listing_type
              column :bedrooms
              column :neighborhood
              column :city
            end
          end
        end
      end
      columns do
         column do
           panel "Open Houses" do
            table_for OpenHouse.order('created_at desc').limit(10).each do |openhouse|
              column("listing id") {|openhouse| link_to Listing.find_by(id: openhouse.listing_id).code, admin_listing_path(Listing.find_by(id: openhouse.listing_id).code) if openhouse.published_listing == true }
              column("start time") {|openhouse| openhouse.human_start_time if openhouse.published_listing == true }
              column("end_time") {|openhouse| openhouse.human_end_time if openhouse.published_listing == true }
            end
          end
        end
        column do
          panel "Unpublished Listings" do
            table_for Listing.unpublished?.limit(10).each do |listing|
              column("Listing ID") {|listing| link_to Listing.find_by(id: listing.id).code, admin_listing_path(Listing.find_by(id: listing.id))}
            end
          end
        end
      end
    end
  end
