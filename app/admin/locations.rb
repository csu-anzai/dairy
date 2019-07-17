ActiveAdmin.register Location do

  menu priority: 1, label: proc { I18n.t("admin.products.location.label") }, parent: 'Stock'
  
  permit_params :vendor, :delivery_executive, :name, :start_point, :end_point, :latitude, :longitude, :status, :description, :created_by, :updated_by
  
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
