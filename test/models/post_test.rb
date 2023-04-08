require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'John Robin', posts_counter: 0)
    @post = Post.new(title: 'Test Title', text: 'Test Text', comments_counter: 0, likes_counter: 0, author: @user)
  end

  test 'post should be valid' do
    assert @post.valid?
  end

  test 'title should be present' do
    @post.title = '     '
    assert_not @post.valid?
  end

  test 'title should not be too long' do
    @post.title = 'a' * 251
    assert_not @post.valid?
  end

  test 'comments counter should be an integer greater than or equal to zero' do
    @post.comments_counter = -1
    assert_not @post.valid?
    @post.comments_counter = 0
    assert @post.valid?
  end

  test 'likes counter should be an integer greater than or equal to zero' do
    @post.likes_counter = -1
    assert_not @post.valid?
    @post.likes_counter = 0
    assert @post.valid?
  end
end
