ActiveAdmin.register AttributeChoice do

  menu priority: 2, label: proc { I18n.t("admin.products.a_c.label") }, parent: 'Products'
  
  permit_params :item_attribute_id,  :name, :active, :created_by, :updated_by
  
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
