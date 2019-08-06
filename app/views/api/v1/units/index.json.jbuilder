json.access_code @units.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.units do
	json.array! @units do |u|
	  json.id u.id
	  json.name u.name
	  json.code u.code
	  json.active u.active
	  json.created_by u.created_by
	  json.updated_by u.updated_by
	  json.created_at u.created_at
	  json.updated_at u.updated_at
	end
end
