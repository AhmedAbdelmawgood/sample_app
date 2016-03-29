class User < ActiveRecord::Base
before_save {self.email = email.downcase}
VALID_EMAIL_REGEX = /\A[\w+\-.]+@([a-z\d\-]+\.?)+[a-z]+\Z/i
validates :email, format: {with: VALID_EMAIL_REGEX, message: 'doesn\'t allowed format'},
									uniqueness: {case_sensitive: false}, length: {maximum: 255}, confirmation: true
validates :name, presence: true, length: {maximum: 50}
has_secure_password
validates :password, presence: true, length: {minimum:8}
=begin
def validate_email 
	if self.email.nil? || (/.+[@](gmail\.com||yahoo\.com)/ =~  self.email ) 
		errors.add(:email, 'doesn\'t seem like a valid option')
	end 
end
=end
end