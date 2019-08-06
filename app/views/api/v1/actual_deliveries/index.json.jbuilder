json.access_code @deliveries.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.deliveries do
	json.array! @deliveries do |del|
	  json.id del.id
	  json.address_id del.address_id
	  json.subscription_id del.subscription_id
	  json.delivery_executive_id del.delivery_executive_id
	  json.remarks del.remarks
	  json.status del.status
	  json.created_by del.created_by
	  json.updated_by del.updated_by
	  json.created_at del.created_at
	  json.updated_at del.updated_at
	end
end
