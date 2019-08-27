json.access_code @item_attribute.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.message 'Created successfully'
json.item_attribute do 
	json.id @item_attribute.id
	json.name @item_attribute.name
	json.created_at @item_attribute.created_at.strftime('%d-%b-%Y ⌚ %I:%M %p')
	json.updated_at @item_attribute.updated_at.strftime('%d-%b-%Y ⌚ %I:%M %p')
end
