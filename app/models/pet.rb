class Pet < ApplicationRecord
	has_many :posts
	belongs_to :user
	validates :user, presence: true
	validates :name, presence: true
	validates :species, presence: true
	validates :breed, presence: true

end
