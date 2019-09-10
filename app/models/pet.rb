class Pet < ApplicationRecord
	has_many :posts
	belongs_to :user
	validates :user, presence: true
	validates :name, presence: true
	validates :species, presence: true
	validates :breed, presence: true

	def self.search(search)
  	where("name LIKE ? OR species LIKE ? OR breed LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
	end

	def self.top_three_pets
  	pets = Pet.includes(:posts).limit(3)
  	pets.flat_map do |pet|
     pet.posts.count
  	end
	end

end
