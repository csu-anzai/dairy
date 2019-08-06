json.access_code @item_categories.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.item_categories do
	json.array! @item_categories do |category|
	  json.id category.id
	  json.name category.name
	  json.created_at category.created_at
	  json.updated_at category.updated_at
	end	
end
