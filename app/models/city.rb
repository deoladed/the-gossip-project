class City < ApplicationRecord
	has_many :users, dependent: :destroy
	validates :name, uniqueness: { case_sensitive: false }
end
