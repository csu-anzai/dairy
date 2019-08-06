json.access_code @customer.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.customer do
	json.(@customer, :salutation, :name, :gender, :username, :email, :mobile, :date_of_birth, :type, :premier, :call_verified, :blacklisted, :active, :created_by, :updated_by)	
end
