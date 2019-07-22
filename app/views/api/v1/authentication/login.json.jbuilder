json.message 'Logged in successfully'
json.user do 
	json.id @user.id
	json.username @user.username
	json.exp_time @time
	json.token @token
	json.created_at @user.created_at
	json.updated_at @user.updated_at
end 