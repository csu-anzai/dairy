json.batches do
	json.array! @batches do |bat|
	  json.id bat.id
	  json.user_id bat.user_id
	  json.item_variant_id bat.item_variant_id
	  json.code bat.code
	  json.manufacturing_date bat.manufacturing_date
	  json.expiry_date bat.expiry_date
	  json.status bat.status
	  json.created_by bat.created_by
	  json.updated_by bat.updated_by
	  json.created_at bat.created_at
	  json.updated_at bat.updated_at
	end
end