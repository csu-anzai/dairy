ActiveAdmin.register Payment do

  menu priority: 2, label: proc { I18n.t("admin.account.label") }, parent: 'Accounts'
  permit_params :subscription_id, :amount, :mode, :paid_by, :remarks, :created_by, :updated_by

  form do |f|
    f.inputs do
      f.input :subscription_id, as: :select, :prompt => "🗓 Select Subscription", collection: Subscription.all.collect {|sub| [ "( #{sub.title} for #{sub.address.receiver_name} ) ⌚  #{sub.start_date.try(:strftime, '%d-%b-%Y')} to #{sub.end_date.try(:strftime, '%d-%b-%Y')}", sub.id ] }
      f.input :amount
      f.input :mode, as: :select, :prompt => "₹ Select Mode", :collection => PAY_MODE
      f.input :paid_by
      f.input :remarks
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

end
