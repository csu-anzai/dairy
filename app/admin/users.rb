ActiveAdmin.register User do
  
  menu priority: 2, label: proc { I18n.t("admin.users.user.label") }, parent: 'Profiles'

  permit_params :salutation, :name, :gender, :username, :email, :mobile, :date_of_birth, :type, :premium, :call_verified, :blacklisted, :active

  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :salutation, as: :select, :prompt => "Select Salutation", :collection => SALUTATION
      f.input :name
      f.input :gender, as: :select, :prompt => "Select Gender", :collection => GENDER
      f.input :username
      f.input :email
      f.input :mobile
      f.input :date_of_birth
      f.input :type, as: :select, :prompt => "Select Type", :collection => USER_TYPE
      # f.input :password
      # f.input :password_confirmation
      f.input :premium
      f.input :call_verified
      f.input :blacklisted
      # f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      # f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :active, as: :select, :prompt => "Select Status", :collection => USER_STATUS
    end
    f.actions
  end
  
end
