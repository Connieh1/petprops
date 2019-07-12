class Pet < ApplicationRecord
	has_many :posts
	has_many :users, through: :posts
	# belongs_to :user
	# validates :user, presence: true
end
