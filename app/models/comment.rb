class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :description, presence: true, length: {minimum: 4, maximum: 140}
  validates :user_id, presence: true
  validates :post_id, presence: true
  default_scope -> { order(updated_at: :desc) }
end
