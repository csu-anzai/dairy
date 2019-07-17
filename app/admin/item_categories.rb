ActiveAdmin.register ItemCategory do

  menu priority: 1, label: proc { I18n.t("admin.categories.i_c.label") }, parent: 'Category'
  
  permit_params :name, :active
  
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
