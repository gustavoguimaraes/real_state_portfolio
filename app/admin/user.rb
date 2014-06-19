ActiveAdmin.register User do

  config.batch_actions = false

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :email, :name, :phone

  index do
    column :name
    column :email
    column :phone
    actions
  end

  show title: :name do |user|
    attributes_table do
      row :name
      row :email
      row :phone
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "User Info" do
      f.input :name
      f.input :email
      f.input :phone, :placeholder => "xxx-xxx-xxxx"
    end
    f.actions
  end

end
