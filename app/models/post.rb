class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :body
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  scope :most_recent, -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :body, presence: true
  validates :tags, presence: true
end
