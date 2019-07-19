ActiveAdmin.register Subscription do

  menu priority: 1, label: proc { I18n.t("admin.subscriptions.subscribe.label") }, parent: 'Subscription'

  permit_params :address_id, :item_variant_id, :unit_id, :title, :quantity, :frequency, :start_date, :end_date, :remarks, :call_verified, :status, :created_by, :updated_by

  form do |f|
    f.inputs do
      f.input :address_id, as: :select, :prompt => "Select user and address", 
              collection: Address.all.collect {|add| [(['(',add.addressable.name, ')-'].join('') + add.address1), add.id] }
      f.input :item_variant_id, as: :select, :prompt => "Select Item", collection: ItemVariant.all.collect {|i_var| [i_var.title, i_var.id] }
      f.input :unit_id, as: :select, :prompt => "Select Unit", collection: Unit.all.collect {|u| [u.name, u.id] }
      f.input :title
      f.input :quantity
      f.input :frequency, as: :select, :prompt => "Select Frequency", :collection => FREQUENCY
      f.input :start_date
      f.input :end_date
      f.input :remarks
      f.input :call_verified
      f.input :status, as: :select, :prompt => "Select Status", :collection => STATUS
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end
  
end
