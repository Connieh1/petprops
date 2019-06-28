class User < ApplicationRecord
  has_many :posts
  has_many :pets, through: :posts

end
