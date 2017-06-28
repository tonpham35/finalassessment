class User < ApplicationRecord
	has_secure_password

	has_many :authentications, dependent: :destroy

	validates :email, :password_digest, presence: {message: "Please fill-in all fields" }
	validates :email, uniqueness: { message: "must be new"}
	validates :email, format: { with: /\w*@.*\.\w*/, message: "Invalid email address" } 
	validates :password_digest, length: { minimum: 6, message: "Password must be at least 6 characters" }

  def self.create_with_auth_and_hash(authentication, auth_hash)
      user = User.create!(full_name: auth_hash["name"], email: auth_hash["extra"]["raw_info"]["email"], password: SecureRandom.hex(5))
      user.authentications << (authentication)      
      return user
  end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end

end
