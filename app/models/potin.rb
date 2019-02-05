class Potin < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commenteable
  has_many :likes, as: :likeable
  has_many :joint_table_potin_tags
  has_many :tags, through: :joint_table_potin_tags

  validates :title, presence: true #, length: { in: 3..14 }
  validates :content, presence: true
end
