require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @post = posts(:one)
    @user = users(:one)
  end

  test 'should create a like' do
    assert_difference('Like.count', 1) do
      @post.likes.create(author_id: @user.id)
    end
  end

  test 'should not create a like without an author' do
    assert_no_difference('Like.count') do
      @post.likes.create(author_id: nil)
    end
  end
end
