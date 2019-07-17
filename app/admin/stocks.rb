ActiveAdmin.register Stock do

  menu priority: 1, label: proc { I18n.t("admin.products.stock.label") }, parent: 'Stock'
  
  permit_params :batch_id, :unit_id, :quantity, :active, :created_by, :updated_by
  
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
