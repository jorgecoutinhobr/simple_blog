class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :body
  has_many :comments, dependent: :destroy

  scope :most_recent, -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :body, presence: true
end
