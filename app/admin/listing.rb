ActiveAdmin.register Listing do

  config.batch_actions = false

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :code, :status, :publish, :listing_type, :listing_page_headline, :listing_page_description,
    :headline, :sub_headline, :description, :headline_image, :street_address, :cross_streets, :city, :state, :zipcode, :bedrooms, :price, :user_id, :neighborhood_id

  controller do
    defaults finder: :find_by_code
  end

  scope :all, default: true
  scope :sales
  scope :rentals

  action_item :only => :show do
    link_to('View on site', listing_path(listing))
  end

  index do
    column :headline_image do |listing|
      link_to image_tag(listing.headline_image.url(:thumb)), admin_listing_path(listing)
    end
    column :code
    column :listing_type
    column :headline
    column :description
    column :city
    column :bedrooms
    column :created_at
    actions
  end

  show title: :code do |listing|
    attributes_table do
      row :code
      row :listing_type
      row :user
      row :status
      row :publish
      row :created_at
      row :updated_at
      row :street_address
      row :cross_streets
      row :neighborhood
      row :city
      row :state
      row :zipcode
      row :price
      row :bedrooms
      row :headline
      row :sub_headline
      row :description
      row :listing_page_headline
      row :listing_page_description
      row :headline_image do
        image_tag(listing.headline_image.url(:thumb))
      end
      row :open_houses do
        button_to("Schedule", new_admin_listing_open_house_path(listing), method: :get)
      end

      panel "Open Houses" do
        render "open_houses", listing: listing
      end

      panel "Gallery" do
        render "gallery", listing: listing
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Internal" do
      f.input :code
      f.input :listing_type, prompt: "Select One", as: :select, collection: Listing.listing_types
      f.input :status, prompt: "Select One", as: :select, collection: Listing.statuses, :selected => "Available"
      f.input :publish
      f.input :user, prompt: "Select One", as: :select, collection: User.all
    end
    f.inputs "Specs" do
      f.input :street_address
      f.input :cross_streets
      f.input :city
      f.input :state
      f.input :zipcode
      f.input :price
      f.input :bedrooms, prompt: "Select One", as: :select, collection: [1,1.5,2,2.5,3,3.5,4,5,6,7,8]
      f.input :neighborhood, prompt: "Select One", as: :select, collection: Neighborhood.all
    end
    f.inputs "Lead Page" do
      f.input :headline_image
      f.input :headline
      f.input :sub_headline
      f.input :description
    end
    f.inputs "Listing Page" do
      f.input :listing_page_headline
      f.input :listing_page_description
    end
    f.actions
    end

    sidebar :images, only: :edit do
      render "gallery", listing: listing
    end
  end
