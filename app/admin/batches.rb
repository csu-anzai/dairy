ActiveAdmin.register Batch do

  menu priority: 2, label: proc { I18n.t("admin.products.batch.label") }, parent: 'Stock'
  
  permit_params :user_id, :item_variant_id, :code, :manufacturing_date, :expiry_date, :status, :created_by, :updated_by
  
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
