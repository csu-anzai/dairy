ActiveAdmin.register Delivery do

  permit_params :address_id, :subscription_id, :remarks, :status, :created_by, :updated_by

  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
