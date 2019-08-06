json.access_code @customers.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.customers do
	json.array! @customers do |cust|
	  json.id cust.id
	  json.salutation cust.salutation
	  json.name cust.name
	  json.gender cust.gender
	  json.username cust.username
	  json.email cust.email
	  json.mobile cust.mobile
	  json.date_of_birth cust.date_of_birth
	  json.premier cust.premier
	  json.call_verified cust.call_verified
	  json.active cust.active
	  json.created_at cust.created_at
	  json.updated_at cust.updated_at
	end
end
