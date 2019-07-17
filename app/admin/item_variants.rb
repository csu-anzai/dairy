ActiveAdmin.register ItemVariant do

  menu priority: 3, label: proc { I18n.t("admin.categories.i_v.label") }, parent: 'Category'
  
  permit_params :item_id, :price, :created_by, :updated_by
  
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
