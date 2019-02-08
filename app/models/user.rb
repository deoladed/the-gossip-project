class User < ApplicationRecord
  attr_accessor :remember_token

	has_secure_password
	before_save { self.email = email.downcase }
	
	belongs_to :city
	has_many :potins, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
	has_many :received_messages, foreign_key: 'recipient_id', class_name: 'PrivateMesssage'

	validates :first_name, presence: true, length: { in: 3..20 }
	validates :password, presence: true, length: { in: 2..30 }
	validates :email, 
		presence: true, length: { in: 6..30 },
		uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

# Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

    # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
