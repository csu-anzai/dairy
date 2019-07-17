ActiveAdmin.register ItemAttribute do

  menu priority: 2, label: proc { I18n.t("admin.categories.i_a.label") }, parent: 'Category'
  
  permit_params :name, :active, :created_by, :updated_by
  
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
