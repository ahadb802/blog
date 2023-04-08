require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @user = User.create(name: 'John Robin', posts_counter: 0)
    @post = Post.new(title: 'Test Title', text: 'Test Text', comments_counter: 0, likes_counter: 0, author: @user)
    @comment = @post.comments.new(author: @user, text: 'Comment')
  end

  test 'author should be present' do
    @comment.author = nil
    assert_not @comment.valid?
  end

  test 'text should be present' do
    @comment.text = nil
    assert_not @comment.valid?
  end

  test 'comments_counter should be decremented when comment is destroyed' do
    @comment.destroy
    assert_equal 0, @post.comments_counter
  end
end
