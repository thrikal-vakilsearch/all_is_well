class User < ActiveRecord::Base
	has_secure_password
	
	def self.authenticate(email, password)
		user = User.find_by(email: email)
		if user and user.authenticate(password)
			user
		else
			'Invalid email or password'
		end
	end
end
