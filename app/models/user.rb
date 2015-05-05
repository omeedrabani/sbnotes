class User < ActiveRecord::Base
	has_many :notes, dependent: :destroy
	attr_accessor :remember_token #remember me
	before_save {self.email = email.downcase}
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}

    has_secure_password
    validates :password, length: { minimum: 6 }, allow_blank: true

	

	# makes hash digest of string. (remember me)
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end



  # gives random token. (remember me)
  def User.new_token
    SecureRandom.urlsafe_base64
  end


 #remembers the user in the database (remember ActiveModel)
  def remember
    self.remember_token = User.new_token																																		
    update_attribute(:remember_digest, User.digest(remember_token))
  end

# check if remember token matches with user's remember digest
  def authenticated?(remember_token)
  	return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end


	