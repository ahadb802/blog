require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Users name must not be blank' do
    user = User.new
    assert_not user.save, 'Saved the user without a name'
  end

  test 'posts counter must be an integer greater than or equal to zero' do
    user = User.new(name: 'John')
    user.posts_counter = 10
    assert user.valid?, 'Valid user with valid posts_counter'

    user.posts_counter = -1
    assert_not user.valid?, 'Invalid user with negative posts_counter'
  end
end
