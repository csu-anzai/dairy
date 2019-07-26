json.add_ons do
	json.array! @add_ons do |addon|
	  json.id addon.id
	  json.title addon.title
	  json.subscription_id addon.subscription_id
	  json.unit_id addon.unit_id
	  json.quantity addon.quantity
	  json.start_date addon.start_date
	  json.end_date addon.end_date
	  json.remarks addon.remarks
	  json.status addon.status
	  json.created_at addon.created_at
	  json.updated_at addon.updated_at
	end
end