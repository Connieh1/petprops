class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  belongs_to :pet
 	default_scope -> { order(updated_at: :desc) }
end
