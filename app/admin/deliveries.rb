ActiveAdmin.register Delivery do

  permit_params :address_id, :subscription_id, :delivery_executive_id, :remarks, :status, :created_by, :updated_by

  form do |f|
    f.inputs do
      f.input :address, as: :select, :prompt => "Select Address", collection: Address.all.collect {|add| [add.address1, add.id] }
      f.input :subscription, as: :select, :prompt => "Select Subscription", collection: Subscription.all.collect {|subs| [subs.title, subs.id] }
      f.input :delivery_executive, as: :select, :prompt => "Select Delivery Executive", collection: DeliveryExecutive.all
      f.input :remarks
      f.input :status, as: :select, :prompt => "Select Status", :collection => STATUS
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end
  
end
