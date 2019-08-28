json.access_code @subscription.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.subscription do
	json.id @subscription.id
  json.title @subscription.title
  json.item_variant @subscription.item_variant.title
  json.quantity @subscription.quantity 
  json.unit "#{@subscription.unit.name}"+"(#{@subscription.unit.code})"
  json.frequency @subscription.frequency == 0 ? "Daily" : @subscription.quantity == 1 ? "Once" : @subscription.quantity == 2 ? "Alternative Days" : "Weekly" 
  json.full_address @subscription.address.address1 + ", " + @subscription.address.address2
  json.start_date @subscription.start_date.strftime('%d-%b-%Y')
  json.end_date @subscription.end_date.strftime('%d-%b-%Y')
  json.remarks @subscription.remarks
  json.call_verified @subscription.call_verified
  json.status @subscription.status
  json.created_by @subscription.created_by
  json.updated_by @subscription.updated_by
  json.created_at @subscription.created_at.strftime('%d-%b-%Y ⌚ %I:%M %p')
  json.updated_at @subscription.updated_at.strftime('%d-%b-%Y ⌚ %I:%M %p')
	# json.(@subscription, :id, :title, :quantity, :frequency, :start_date, :end_date, :remarks, :call_verified, :status, :created_by, :updated_by, :created_at, :updated_at)
end
