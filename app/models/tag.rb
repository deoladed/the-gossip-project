class Tag < ApplicationRecord
	  has_many :joint_table_potin_tags
	  has_many :potins, through: :joint_table_potin_tags

	  validates :title, uniqueness: true
end
