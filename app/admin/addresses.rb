ActiveAdmin.register Address do

  menu priority: 3, label: proc { I18n.t("admin.users.address.label") }, parent: 'Profiles'
 
  permit_params :user_id, :location_id, :address1, :address2, :addressable_id, :addressable_type, :latitude, :longitude, :receiver_name, :receiver_mobile, :land_mark, :zip, :remarks, :status, :created_by, :updated_by 
  
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :user_id, as: :select, :prompt => "Select User", collection: User.all.collect {|usr| [usr.name, usr.id] }
      f.input :location_id, as: :select, :prompt => "Select Location", collection: Location.all.collect {|loc| [ "#{loc.name} : #{loc.start_point} - #{loc.end_point}", loc.id ] }
      f.input :addressable, as: :select, :prompt => "Select User", collection: User.all.collect {|usr| [usr.name, usr.id] }
      f.input :address1
      f.input :address2
      f.input :latitude
      f.input :longitude
      f.input :receiver_name
      f.input :receiver_mobile
      f.input :land_mark
      f.input :zip
      f.input :remarks
      f.input :status, as: :select, :prompt => "Select Status", :collection => STATUS
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end
  
end
