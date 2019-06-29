class Post < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  validates :chef_id, presence: true
end
