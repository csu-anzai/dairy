json.message 'Created successfully'
json.item_category do 
	json.id @item_category.id
	json.name @item_category.name
	json.created_at @item_category.created_at
	json.updated_at @item_category.updated_at
end 