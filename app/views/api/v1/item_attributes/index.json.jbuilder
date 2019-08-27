json.access_code @item_attributes.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.item_attributes do
	json.array! @item_attributes do |attribute|
	  json.id attribute.id
	  json.name attribute.name
	  json.created_at attribute.created_at.strftime('%d-%b-%Y ⌚ %I:%M %p')
	  json.updated_at attribute.updated_at.strftime('%d-%b-%Y ⌚ %I:%M %p')
	end
end
