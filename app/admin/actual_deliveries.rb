ActiveAdmin.register ActualDelivery do

  permit_params :address_id, :subscription_id, :delivery_executive_id, :unit_id, :quantity, :amount, :remarks, :status, :created_by, :updated_by

  action_item :daily_deliveries, only: :index do
    link_to 'Daily Delivery Report', admin_actual_deliveries_daily_delivery_report_path
  end

  form do |f|
    f.inputs do
      f.input :address, as: :select, :prompt => "🏠 Select Address", collection: Address.all.collect {|add| [(['( ☻',add.addressable.name, ', ☎ ', add.addressable.mobile, ' ) @ '].join('') + add.address1), add.id] }
      f.input :subscription, as: :select, :prompt => "🗓 Select Subscription", collection: Subscription.all.collect {|sub| [ "( #{sub.title} for #{sub.address.receiver_name} ) ⌚  #{sub.start_date.try(:strftime, '%d-%b-%Y')} to #{sub.end_date.try(:strftime, '%d-%b-%Y')}", sub.id ] }
      f.input :delivery_executive, as: :select, :prompt => "🚚 Select Delivery Executive", collection: DeliveryExecutive.all.collect { |de| [ "#{de.name}, ☎ #{de.mobile}", de.id]}
      f.input :quantity
      f.input :unit, as: :select, :prompt => "⚖️ Select Unit", collection: Unit.all.collect {|u| [u.name, u.id] }
      f.input :amount
      f.input :remarks
      f.input :status, as: :select, :prompt => "✔ Select Status", :collection => DELIVERY_STATUS
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

  controller do
    def daily_delivery_report
      array = []
      Subscription.active.each_with_index do |subs, index|
        if subs.active_addon.present?
          addon_qty = subs.active_addon.quantity
          addon_title = subs.active_addon.title
        end
        array << {
          Index: index + 1,
          Full_address: subs.address.address1 + subs.address.address2,
          Receiver_name: subs.address.receiver_name,
          Receiver_mobile: subs.address.receiver_mobile,
          Title: subs.title,
          Variant: subs.item_variant.title,
          Quantity: subs.quantity + addon_qty,
          Unit: subs.unit.code,
          Frequency: (subs.frequency == 0) ? "Daily" : (subs.frequency == 1) ? "Once" : (subs.frequency == 2) ? "Alternative Days" : "Weekly",
          Period: subs.start_date.strftime("%d %b %Y") + " To " + subs.end_date.strftime("%d %b %Y"),
          Remarks: subs.remarks,
          Add_details: "#{addon_qty} Ltr. required as #{addon_title}.",
          Is_delivered: ''
        }
      end
      send_data ActualDelivery.to_csv(array), filename: "Delivery-Report-#{Date.current}.csv", type: 'text/csv', disposition: 'attachment'
    end
  end
  
end
