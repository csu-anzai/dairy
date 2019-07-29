json.stocks do
	json.array! @stocks do |stk|
	  json.id stk.id
	  json.batch_id stk.batch_id
	  json.unit_id stk.unit_id
	  json.quantity stk.quantity
	  json.active stk.active
	  json.created_by stk.created_by
	  json.updated_by stk.updated_by
	  json.created_at stk.created_at
	  json.updated_at stk.updated_at
	end
end