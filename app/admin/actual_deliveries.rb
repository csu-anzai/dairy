ActiveAdmin.register ActualDelivery do

  permit_params :address_id, :subscription_id, :delivery_executive_id, :unit_id, :quantity, :amount, :remarks, :status, :created_by, :updated_by

  form do |f|
    f.inputs do
      f.input :address, as: :select, :prompt => "🏠 Select Address", collection: Address.all.collect {|add| [(['( ☻',add.addressable.name, ', ☎ ', add.addressable.mobile, ' ) @ '].join('') + add.address1), add.id] }
      f.input :subscription, as: :select, :prompt => "🗓 Select Subscription", collection: Subscription.all.collect {|sub| [ "( #{sub.title} for #{sub.address.receiver_name} ) ⌚  #{sub.start_date.try(:strftime, '%d-%b-%Y')} to #{sub.end_date.try(:strftime, '%d-%b-%Y')}", sub.id ] }
      f.input :delivery_executive, as: :select, :prompt => "🚚 Select Delivery Executive", collection: DeliveryExecutive.all.collect { |de| [ "#{de.name}, ☎ #{de.mobile}", de.id]}
      f.input :quantity
      f.input :unit, as: :select, :prompt => "⚖️ Select Unit", collection: Unit.all.collect {|u| [u.name, u.id] }
      f.input :amount
      f.input :remarks
      f.input :status, as: :select, :prompt => "✔ Select Status", :collection => STATUS
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end
  
end
