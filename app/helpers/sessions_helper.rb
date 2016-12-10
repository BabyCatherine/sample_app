module SessionsHelper

	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user) #Определение назначения current_user. 
		@current_user = user
	end

	def current_user #Поиск текущего пользователя с помощью remember_token. 
		remember_token = User.encrypt(cookies[:remember_token]) #Получаем токен из куки, шифруем его методо User.encrypt
		@current_user ||= User.find_by(remember_token: remember_token) #V tetradke
	end

	def sign_out
		current_user.update_attribute(:remember_token, 
									User.encrypt(User.new_remember_token))
		cookies.delete(:remember_token)
		self.current_user = nil
	end
end
