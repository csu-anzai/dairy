json.item_variants do
	json.array! @item_variants do |i_var|
	  json.id i_var.id
	  json.item_id i_var.item_id
	  json.title i_var.title
	  json.price i_var.price
	  json.active i_var.active
	  json.created_by i_var.created_by
	  json.updated_by i_var.updated_by
	  json.created_at i_var.created_at
	  json.updated_at i_var.updated_at
	end
end