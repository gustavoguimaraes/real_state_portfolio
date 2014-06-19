ActiveAdmin.register Image do

  belongs_to :listing, finder: :find_by_code, optional: true

  permit_params :gallery_image, :listing_id, :listing, :position, :image

  collection_action :sort, method: :post do
    params[:image].each_with_index do |id, index|
      Image.find_by(id: id).update_attributes({position: (index + 1), id: id})
    end
    render nothing: true
  end

  controller do
    def create
      super do |format|
        redirect_to admin_listing_path(resource.listing) and return if resource.valid?
      end
    end

    def destroy
      super do |format|
        redirect_to admin_listing_path(resource.listing) and return
      end
    end
  end

  form do |f|
    f.semantic_errors(*f.object.errors.keys)
    f.inputs "Image" do
      f.input :gallery_image
    end
    f.actions
  end
end