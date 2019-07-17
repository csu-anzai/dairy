ActiveAdmin.register Addon do
  menu priority: 2, label: proc { I18n.t("admin.subscriptions.add_ons.label") }, parent: 'Subscription'
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :subscription_id, :quantity, :unit_id, :start_date, :end_date, :remarks, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
