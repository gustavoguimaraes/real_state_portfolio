ActiveAdmin.register OpenHouse do
  belongs_to :listing, finder: :find_by_code, optional: true

  permit_params :start_time, :end_time, :listing_id, :start_time_date, :start_time_time_hour, :start_time_time_minute, :end_time_date, :end_time_time_hour, :end_time_time_minute

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :start_time, :as => :just_datetime_picker
      f.input :end_time, :as => :just_datetime_picker
    end
    f.actions
  end

  show do |image|
    attributes_table do
      row :start_time
      row :end_time
      row :listing do
        link_to open_house.listing.code, admin_listing_path(open_house.listing)
      end
    end
  end

end
