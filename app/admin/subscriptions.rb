ActiveAdmin.register Subscription do

  menu priority: 1, label: proc { I18n.t("admin.subscriptions.subscribe.label") }, parent: 'Subscription'

  permit_params :address_id, :item_variant_id, :unit_id, :quantity, :frequency, :start_date, :end_date, :remarks, :call_verified, :status, :created_by, :updated_by

  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
