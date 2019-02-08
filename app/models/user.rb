class User < ApplicationRecord
	has_secure_password
	
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
		uniqueness: { case_sensitive: false },
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
end
