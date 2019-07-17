ActiveAdmin.register Unit do

  menu priority: 3, label: proc { I18n.t("admin.products.unit.label") }, parent: 'Products'
  
  permit_params :name, :code, :active, :created_by, :updated_by
  
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
