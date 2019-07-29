json.items do
	json.array! @items do |i|
	  json.id i.id
	  json.name i.name
	  json.item_category_id i.item_category_id
	  json.active i.active
	  json.created_by i.created_by
	  json.updated_by i.updated_by
	  json.created_at i.created_at
	  json.updated_at i.updated_at
	end
end