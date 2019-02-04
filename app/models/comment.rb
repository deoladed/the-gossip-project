class Comment < ApplicationRecord
	belongs_to :user
	has_many :likes, as: :likeable
	belongs_to :commenteable, polymorphic: true
  has_many :comments, as: :commenteable
end
