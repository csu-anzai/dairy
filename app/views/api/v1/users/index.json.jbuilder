json.access_code @users.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.users do
	json.array! @users do |usr|
	  json.id usr.id
	  json.salutation usr.salutation
	  json.name usr.name
	  json.gender usr.gender
	  json.email usr.email
	  json.mobile usr.mobile
	  json.date_of_birth usr.date_of_birth
	  json.premier usr.premier
	  json.call_verified usr.call_verified
	  json.blacklisted usr.blacklisted
	  json.created_by usr.created_by
	  json.updated_by usr.updated_by
	  json.created_at usr.created_at
	  json.updated_at usr.updated_at
	end
end
