json.access_code @item_category.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.message 'Created successfully'
json.item_category do 
	json.id @item_category.id
	json.name @item_category.name
	json.created_at @item_category.created_at.strftime('%d-%b-%Y @ %H:%M')
	json.updated_at @item_category.updated_at.strftime('%d-%b-%Y @ %H:%M')
end
