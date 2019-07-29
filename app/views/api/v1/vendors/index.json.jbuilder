json.vendors do
	json.array! @vendors do |ven|
	  json.id ven.id
	  json.salutation ven.salutation
	  json.name ven.name
	  json.gender ven.gender
	  json.email ven.email
	  json.mobile ven.mobile
	  json.date_of_birth ven.date_of_birth
	  json.premier ven.premier
	  json.call_verified ven.call_verified
	  json.blacklisted ven.blacklisted
	  json.created_by ven.created_by
	  json.updated_by ven.updated_by
	  json.created_at ven.created_at
	  json.updated_at ven.updated_at
	end
end