require 'uri'
class User < ApplicationRecord
    has_secure_password
    validates :email, 
              uniqueness: { message: "This email address is already in use"}, 
              format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
    validates :password, confirmation: {message: "Password confirm does not match"}
end
