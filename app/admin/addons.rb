ActiveAdmin.register Addon do
  
  menu priority: 2, label: proc { I18n.t("admin.subscriptions.add_ons.label") }, parent: 'Subscription'
  
  permit_params :subscription_id, :title, :quantity, :unit_id, :start_date, :end_date, :remarks, :status, :created_by, :updated_by
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :subscription_id, as: :select, :prompt => "🗓 Select Subscription", collection: Subscription.all.collect {|sub| [ "( #{sub.title} for #{sub.address.receiver_name} ) ⌚  #{sub.start_date.try(:strftime, '%d-%b-%Y')} to #{sub.end_date.try(:strftime, '%d-%b-%Y')}", sub.id ] }
      f.input :title
      f.input :quantity
      f.input :unit_id, as: :select, :prompt => "⚖️ Select Unit", collection: Unit.all.collect { |u| [ "⌛ #{u.name}", u.id]}
      f.input :start_date
      f.input :end_date
      f.input :remarks
      f.input :status, as: :select, :prompt => "✔ Select Status", :collection => ADD_ON_STATUS
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end
  
end
