class Like < ApplicationRecord
  # belongs_to :user
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  # def self.update_likes_counter(post_id)
  #   post = Post.find(post_id)
  #   post.update(likes_counter: post.likes.count)
  # end

  def update_likes_counter(_post_id)
    post.increment!(:likes_counter)
  end
end
