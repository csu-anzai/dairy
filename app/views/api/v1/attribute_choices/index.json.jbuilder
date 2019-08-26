json.access_code @attribute_choices.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.attribute_choices do
	json.array! @attribute_choices do |attr_chc|
	  json.id attr_chc.id
	  json.item_attribute_id attr_chc.item_attribute_id
	  json.name attr_chc.name
	  json.active attr_chc.active
	  json.created_by attr_chc.created_by
	  json.updated_by attr_chc.updated_by
	  json.created_at attr_chc.created_at.strftime('%d-%b-%Y @ %H:%M')
	  json.updated_at attr_chc.updated_at.strftime('%d-%b-%Y @ %H:%M')
	end
end
