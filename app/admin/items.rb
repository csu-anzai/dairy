ActiveAdmin.register Item do

  menu priority: 1, label: proc { I18n.t("admin.products.item.label") }, parent: 'Products'
  
  permit_params :item_category_id, :name, :active
  
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
