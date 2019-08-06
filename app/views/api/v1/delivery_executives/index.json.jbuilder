json.access_code @d_executives.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.delivery_executives do
	json.array! @d_executives do |exe|
	  json.id exe.id
	  json.salutation exe.salutation
	  json.name exe.name
	  json.gender exe.gender
	  json.email exe.email
	  json.mobile exe.mobile
	  json.date_of_birth exe.date_of_birth
	  json.premier exe.premier
	  json.call_verified exe.call_verified
	  json.blacklisted exe.blacklisted
	  json.created_by exe.created_by
	  json.updated_by exe.updated_by
	  json.created_at exe.created_at
	  json.updated_at exe.updated_at
	end
end
