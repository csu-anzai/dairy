json.message 'Created successfully'
json.address do 
	json.id @address.id
	json.name @address.name
	json.created_at @address.created_at
	json.updated_at @address.updated_at
end 