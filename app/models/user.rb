class User < ApplicationRecord
	before_save {self.email = email.downcase}
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
 	has_secure_password
 	validates :password, presence: true, length: { minimum: 5 }
  has_many :posts, dependent: :destroy
  has_many :pets, through: :posts
  # has_many :pets
  # accepts_nested_attributes_for :pets
 

end
