json.access_code @stocks.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.stocks do
	json.array! @stocks do |stk|
	  json.id stk.id
	  json.batch_id stk.batch_id
	  json.unit_id stk.unit_id
	  json.quantity stk.quantity
	  json.active stk.active
	  json.created_by stk.created_by
	  json.updated_by stk.updated_by
	  json.created_at stk.created_at.strftime('%d-%b-%Y ⌚ %I:%M %p')
	  json.updated_at stk.updated_at.strftime('%d-%b-%Y ⌚ %I:%M %p')
	end
end
