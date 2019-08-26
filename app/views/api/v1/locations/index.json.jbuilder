json.access_code @locations.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.locations do
	json.array! @locations do |loc|
	  json.id loc.id
	  json.vendor_id loc.vendor_id
	  json.delivery_executive_id loc.delivery_executive_id
	  json.name loc.name
	  json.start_point loc.start_point
	  json.end_point loc.end_point
	  json.latitude loc.latitude
	  json.longitude loc.longitude
	  json.status loc.status
	  json.created_by loc.created_by
	  json.updated_by loc.updated_by
	  json.created_at loc.created_at.strftime('%d-%b-%Y @ %H:%M')
	  json.updated_at loc.updated_at.strftime('%d-%b-%Y @ %H:%M')
	end
end
