class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  belongs_to :pet
  has_many :comments, dependent: :destroy
  has_many :commentators, through: :comments, source: :user
 	default_scope -> { order(updated_at: :desc) }
end
