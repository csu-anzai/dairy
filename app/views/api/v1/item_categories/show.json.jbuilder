json.access_code @item_category.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.item_category do
	json.id @item_category.id
  json.name @item_category.name
  json.created_at @item_category.created_at.strftime('%d-%b-%Y ⌚ %I:%M %p')
  json.updated_at @item_category.updated_at.strftime('%d-%b-%Y ⌚ %I:%M %p')
	# json.(@item_category, :id, :name, :created_at, :updated_at)
end
