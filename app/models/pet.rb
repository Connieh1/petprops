class Pet < ApplicationRecord
	has_many :posts
	belongs_to :user
	validates :user, presence: true

end
