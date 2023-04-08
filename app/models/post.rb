class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :text, presence: true

  def update_user_posts_counter
    author.increment!(:posts_counter)
  end

  def recent_comments(num = 5)
    comments.order(created_at: :desc).limit(num)
  end
end
