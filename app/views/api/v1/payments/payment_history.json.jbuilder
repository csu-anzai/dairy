json.access_code @payments.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.payments do
	json.array! @payments do |pay|
	  json.id pay.id
	  json.amount pay.amount
	  json.subscription_id pay.subscription_id
	  json.mode pay.mode
	  json.paid_by pay.paid_by
	  json.remarks pay.remarks
	  json.created_by pay.created_by
	  json.updated_by pay.updated_by
	  json.created_at pay.created_at.strftime('%d-%b-%Y @ %H:%M')
	  json.updated_at pay.updated_at.strftime('%d-%b-%Y @ %H:%M')
	end
end
