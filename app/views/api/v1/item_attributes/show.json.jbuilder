json.access_code @item_attribute.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.item_attribute do
	json.(@item_attribute, :id, :name, :created_at, :updated_at)
end
