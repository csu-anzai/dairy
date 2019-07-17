ActiveAdmin.register Address do

  menu priority: 3, label: proc { I18n.t("admin.users.address.label") }, parent: 'Profiles'
 
  permit_params :user_id, :location_id, :address1, :address2, :addressable_id, :addressable_type, :latitude, :longitude, :receiver_name, :receiver_mobile, :land_mark, :zip, :status 
  
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
