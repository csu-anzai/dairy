ActiveAdmin.register Subscription do

  menu priority: 1, label: proc { I18n.t("admin.subscriptions.subscribe.label") }, parent: 'Subscription'

  permit_params :address_id, :item_variant_id, :unit_id, :title, :quantity, :frequency, :start_date, :end_date, :remarks, :call_verified, :status, :created_by, :updated_by

  action_item :daily_deliveries, only: :index do
    link_to 'Daily Delivery Report', admin_subscriptions_daily_delivery_report_path
  end

  form do |f|
    f.inputs do
      f.input :address_id, as: :select, :prompt => "☻Ⓒ Select Customer & Address", 
              collection: Address.all.collect {|add| [(['( ☻',add.addressable.name, ', ☎ ', add.addressable.mobile, ' ) 🏠 '].join('') + add.address1), add.id] }
      f.input :item_variant_id, as: :select, :prompt => "Ⓘ Select Item", collection: ItemVariant.all.collect {|i_var| [i_var.title, i_var.id] }
      f.input :unit_id, as: :select, :prompt => "⚖️ Select Unit", collection: Unit.all.collect {|u| [u.name, u.id] }
      f.input :title
      f.input :quantity
      f.input :frequency, as: :select, :prompt => "♬ Select Frequency", :collection => FREQUENCY
      f.input :start_date
      f.input :end_date
      f.input :remarks
      f.input :call_verified
      f.input :status, as: :select, :prompt => "✔ Select Status", :collection => STATUS
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

  controller do
    def daily_delivery_report
      array = []
      Subscription.active.each_with_index do |subs, index|
        array << {
          Index: index + 1,
          Full_address: subs.address.address1 + subs.address.address2,
          Receiver_name: subs.address.receiver_name,
          Receiver_mobile: subs.address.receiver_mobile,
          Title: subs.title,
          Variant: subs.item_variant.title,
          Quantity: subs.quantity,
          Unit: subs.unit.code,
          Frequency: (subs.frequency == 0) ? "Daily" : (subs.frequency == 1) ? "Once" : (subs.frequency == 2) ? "Alternative Days" : "Weekly",
          Period: subs.start_date.strftime("%d %b %Y") + " To " + subs.end_date.strftime("%d %b %Y"),
          Remarks: subs.remarks,
          Is_delivered: ''
        }
      end
      send_data Subscription.to_csv(array), filename: "Delivery-Report-#{Date.current}.csv", type: 'text/csv', disposition: 'attachment'
    end
  end  
end
