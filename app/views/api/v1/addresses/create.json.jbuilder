json.message 'Created successfully'
json.address do 
  json.id @address.id
  json.address1 @address.address1
  json.address2 @address.address2
  json.addressable do
  	json.user_name @address.addressable.name
  	json.mobile @address.addressable.mobile
  	json.date_of_birth @address.addressable.date_of_birth
  end
  json.latitude @address.latitude
  json.longitude @address.longitude
  json.receiver_name @address.receiver_name
  json.receiver_mobile @address.receiver_mobile
  json.land_mark @address.land_mark
  json.zip @address.zip
  json.remarks @address.remarks
  json.status @address.status
  json.created_by @address.created_by
  json.updated_by @address.updated_by
  json.created_at @address.created_at
  json.updated_at @address.updated_at
end 