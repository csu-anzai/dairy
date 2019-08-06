json.access_code @address.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.address do
	json.(@address, :id, :address1, :latitude, :longitude, :receiver_name, :receiver_mobile, :land_mark, :zip, :remarks, :status, :created_by, :updated_by, :created_at, :updated_at)
end
