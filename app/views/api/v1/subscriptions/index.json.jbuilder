json.access_code @subscriptions.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.subscriptions do 
	json.array! @subscriptions do |subs|
	  json.id subs.id
	  json.address_id subs.address_id
	  json.item_variant_id subs.item_variant_id
	  json.unit_id subs.unit_id
	  json.title subs.title
	  json.quantity subs.quantity
	  json.frequency subs.frequency
	  json.start_date subs.start_date
	  json.end_date subs.end_date
	  json.remarks subs.remarks
	  json.call_verified subs.call_verified
	  json.status subs.status
	  json.created_by subs.created_by
	  json.updated_by subs.updated_by
	  json.created_at subs.created_at
	  json.updated_at subs.updated_at
	end
end
