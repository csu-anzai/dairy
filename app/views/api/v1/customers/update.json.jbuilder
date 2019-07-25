json.message 'Updated successfully'
json.customer do 
	json.id @customer.id
	json.salutation @customer.salutation
	json.name @customer.name
	json.gender @customer.gender
	json.username @customer.username
	json.email @customer.email
	json.mobile @customer.mobile
	json.date_of_birth @customer.date_of_birth
	json.premier @customer.premier
	json.call_verified @customer.call_verified
	json.active @customer.active
	json.created_at @customer.created_at
	json.updated_at @customer.updated_at
end 
