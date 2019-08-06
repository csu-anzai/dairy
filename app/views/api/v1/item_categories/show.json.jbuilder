json.access_code @item_category.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.item_category do
	json.(@item_category, :id, :name, :created_at, :updated_at)
end
