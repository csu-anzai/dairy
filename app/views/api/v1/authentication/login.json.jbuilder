json.access_code @user.present? ? I18n.t('access_code.success') : I18n.t('access_code.failure')
json.message 'Logged in successfully'
json.user do 
	json.id @user.id
	json.username @user.username
	json.exp_time @time
	json.token @token
	json.created_at @user.created_at.strftime('%d-%b-%Y @ %H:%M')
	json.updated_at @user.updated_at.strftime('%d-%b-%Y @ %H:%M')
end
