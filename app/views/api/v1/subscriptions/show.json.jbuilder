json.access_code @subscription.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.subscription do
	json.(@subscription, :id, :title, :quantity, :frequency, :start_date, :end_date, :remarks, :call_verified, :status, :created_by, :updated_by, :created_at, :updated_at)
end
