class User < ActiveRecord::Base
	has_many :notes, dependent: :destroy
	attr_accessor :remember_token #remember me
  attr_accessor :remember_token, :activation_token, :reset_token
	before_save {self.email = email.downcase}
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}

    has_secure_password
    validates :password, length: { minimum: 6 }, allow_blank: true

	
  ##
  #@usage:: makes hash digest of string (remember me)
	#@param:: string representation of user password
  #@return:: BCrypt hash of user password
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

 # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

 # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  ##
  #@usage:: creates new token (remember me)
  #@return:: remember me token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  ##
  #@usage:: remembers the user in the database (remember ActiveModel)
  def remember
    self.remember_token = User.new_token																																		
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  ##
  #@usage:: check if remember token matches with user's remember digest
  #@param:: remember_token to be matched against token
  def authenticated?(remember_token)
  	return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  ##
  #@usage:: forget user remember token
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

end


	