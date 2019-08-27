json.access_code @addresses.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.addresses do
	json.array! @addresses do |add|
	  json.id add.id
	  json.address1 add.address1
	  json.address2 add.address2
	  json.addressable do
	  	json.user_name add.addressable.name
	  	json.mobile add.addressable.mobile
	  	json.date_of_birth add.addressable.date_of_birth
	  end
	  json.latitude add.latitude
	  json.longitude add.longitude
	  json.receiver_name add.receiver_name
	  json.receiver_mobile add.receiver_mobile
	  json.land_mark add.land_mark
	  json.zip add.zip
	  json.remarks add.remarks
	  json.status add.status
	  json.created_by add.created_by
	  json.updated_by add.updated_by
	  json.created_at add.created_at.strftime('%d-%b-%Y @ %H:%M')
	  json.updated_at add.updated_at.strftime('%d-%b-%Y @ %H:%M')
	end
end
