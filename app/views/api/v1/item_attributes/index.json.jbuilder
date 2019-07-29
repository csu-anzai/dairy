json.item_attributes do
	json.array! @item_attribute do |attribute|
	  json.id attribute.id
	  json.name attribute.name
	  json.created_at attribute.created_at
	  json.updated_at attribute.updated_at
	end
end