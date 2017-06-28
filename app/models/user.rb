class User < ApplicationRecord
	has_secure_password

	validates :email, :password_digest, :full_name, presence: {message: "Please fill-in all fields" }
	validates :email, uniqueness: { message: "must be new"}
	validates :email, format: { with: /\w*@.*\.\w*/, message: "Invalid email address" } 
	validates :password_digest, length: { minimum: 6, message: "Password must be at least 6 characters" }
end
