json.access_code @subscriptions.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.subscriptions do 
	json.array! @subscriptions do |subs|
	  json.id subs.id
	  json.title subs.title
	  json.item_variant subs.item_variant.title
	  json.quantity subs.quantity 
	  json.unit "#{subs.unit.name}"+"(#{subs.unit.code})"
	  json.frequency subs.frequency == 0 ? "Daily" : subs.quantity == 1 ? "Once" : subs.quantity == 2 ? "Alternative Days" : "Weekly" 
	  json.full_address subs.address.address1 + ", " + subs.address.address2
	  json.start_date subs.start_date.strftime('%d-%b-%Y')
	  json.end_date subs.end_date.strftime('%d-%b-%Y')
	  json.remarks subs.remarks
	  json.call_verified subs.call_verified
	  json.status subs.status
	  json.created_by subs.created_by
	  json.updated_by subs.updated_by
	  json.created_at subs.created_at.strftime('%d-%b-%Y @ %H:%M')
	  json.updated_at subs.updated_at.strftime('%d-%b-%Y @ %H:%M')
	end
end
