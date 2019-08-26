json.access_code @add_ons.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.add_ons do
	json.array! @add_ons do |addon|
	  json.id addon.id
	  json.title addon.title
	  json.subscription "#{addon.subscription.title} (#{addon.subscription.start_date.strftime('%d-%b-%Y')} to #{addon.subscription.end_date.strftime('%d-%b-%Y')})"
	  json.quantity addon.quantity
	  json.unit "#{addon.unit.name}"+"(#{addon.unit.code})"
	  json.start_date addon.start_date.strftime('%d-%b-%Y')
	  json.end_date addon.end_date.strftime('%d-%b-%Y')
	  json.remarks addon.remarks
	  json.status addon.status
	  json.created_at addon.created_at.strftime('%d-%b-%Y @ %H:%M')
	  json.updated_at addon.updated_at.strftime('%d-%b-%Y @ %H:%M')
	end
end
