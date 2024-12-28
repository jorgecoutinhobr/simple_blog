class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post

  scope :most_recent, -> { order(created_at: :desc) }
end
