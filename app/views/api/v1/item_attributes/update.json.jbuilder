json.message 'Updated successfully'
json.item_attribute do 
	json.id @item_attribute.id
	json.name @item_attribute.name
	json.created_at @item_attribute.created_at
	json.updated_at @item_attribute.updated_at
end 