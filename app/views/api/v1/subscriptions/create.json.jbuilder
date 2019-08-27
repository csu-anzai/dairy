json.access_code @subscription.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.message 'Created successfully'
json.subscription do 
  json.id @subscription.id
  json.address_id @subscription.address_id
  json.item_variant_id @subscription.item_variant_id
  json.unit_id @subscription.unit_id
  json.title @subscription.title
  json.quantity @subscription.quantity
  json.frequency @subscription.frequency
  json.start_date @subscription.start_date
  json.end_date @subscription.end_date
  json.remarks @subscription.remarks
  json.call_verified @subscription.call_verified
  json.status @subscription.status
  json.created_by @subscription.created_by
  json.updated_by @subscription.updated_by
  json.created_at @subscription.created_at.strftime('%d-%b-%Y ⌚ %I:%M %p')
  json.updated_at @subscription.updated_at.strftime('%d-%b-%Y ⌚ %I:%M %p')
end
