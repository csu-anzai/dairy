json.access_code @add_on.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.message I18n.t('api.model.updated')
json.add_on do 
	json.id @add_on.id
	json.subscription_id @add_on.subscription_id
	json.unit_id @add_on.unit_id
	json.title @add_on.title
	json.quantity @add_on.quantity
	json.start_date @add_on.start_date
	json.end_date @add_on.end_date
	json.remarks @add_on.remarks
	json.status @add_on.status
	json.created_at @add_on.created_at.strftime('%d-%b-%Y @ %H:%M')
	json.updated_at @add_on.updated_at.strftime('%d-%b-%Y @ %H:%M')
end
