class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :body

  scope :most_recent, -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :body, presence: true
end
