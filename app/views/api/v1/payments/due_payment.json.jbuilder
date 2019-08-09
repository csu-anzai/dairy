json.access_code @payment.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
# json.current_payment do
	json.payment_breakup @payment
# end