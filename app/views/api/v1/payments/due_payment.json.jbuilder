json.access_code @payment.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.due_payment do
	json.amount @payment
end