class User < ApplicationRecord
    #has_one_attached :avatar
	has_many :messages
	before_save { self.email = email.downcase }
	validates :username, 
					presence: true, 
					length: { minimum: 4, maximum: 25 },
					uniqueness: { case_sensitive: false }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	# validates :email,
	# 				presence: true,
	# 				uniqueness: { case_sensitive: false },
	# 				format: { with: VALID_EMAIL_REGEX }

	has_secure_password #required for gem bcrypt password authentication
	
end
