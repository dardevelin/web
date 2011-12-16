ActiveAdmin.register Project do
  index do
    column :title
    column :quote
    column :created_at
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :quote
      f.input :client_name
      f.input :category, collection: WorkCategory.all
      f.input :screenshot
      f.input :description
      f.input :extended_description
      f.input :url
    end
    f.inputs "Metadata" do
      f.input :published
      f.input :promoted
      f.input :created_at
    end
    f.buttons
  end
end
