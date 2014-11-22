class User < ActiveRecord::Base
	has_secure_password
	has_many :addresses, :dependent => :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true, reject_if: :all_blank

  def as_json(options={})
    super(:include => [:addresses])
  end
  
	def self.authenticate(email, password)
		user = User.find_by(email: email)
		if user and user.authenticate(password)
			user
		else
			'Invalid email or password'
		end
	end
end
