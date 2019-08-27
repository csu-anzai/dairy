json.access_code @batches.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.batches do
	json.array! @batches do |bat|
	  json.id bat.id
	  json.user_id bat.user_id
	  json.item_variant_id bat.item_variant_id
	  json.code bat.code
	  json.manufacturing_date bat.manufacturing_date.strftime('%d-%b-%Y')
	  json.expiry_date bat.expiry_date.strftime('%d-%b-%Y')
	  json.status bat.status
	  json.created_by bat.created_by
	  json.updated_by bat.updated_by
	  json.created_at bat.created_at.strftime('%d-%b-%Y @ %H:%M')
	  json.updated_at bat.updated_at.strftime('%d-%b-%Y @ %H:%M')
	end
end
