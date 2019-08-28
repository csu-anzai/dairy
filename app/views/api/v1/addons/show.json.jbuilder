json.access_code @add_on.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.add_on do
	json.id @add_on.id
  json.title @add_on.title
  json.subscription "#{@add_on.subscription.title} (#{@add_on.subscription.start_date.strftime('%d-%b-%Y')} to #{@add_on.subscription.end_date.strftime('%d-%b-%Y')})"
  json.quantity @add_on.quantity
  json.unit "#{@add_on.unit.name}"+"(#{@add_on.unit.code})"
  json.start_date @add_on.start_date.strftime('%d-%b-%Y')
  json.end_date @add_on.end_date.strftime('%d-%b-%Y')
  json.remarks @add_on.remarks
  json.status @add_on.status
  json.created_at @add_on.created_at.strftime('%d-%b-%Y ⌚ %I:%M %p')
  json.updated_at @add_on.updated_at.strftime('%d-%b-%Y ⌚ %I:%M %p')
end
