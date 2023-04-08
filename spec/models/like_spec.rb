require 'rails_helper'

RSpec.describe Like, type: :model do
  author_uno = User.new(name: 'Juan', photo: 'http://jun.png', bio: 'Engineer', posts_counter: 5)
  post_uno = Post.new(author: author_uno, title: 'First post', text: 'Lorem Ipsum', comments_counter: 2,
                      likes_counter: 0)

  context 'When testing update_like_counter method' do
    it 'should update the post likesCounter after create a like' do
      Like.create(post: post_uno, author: author_uno)
      expect(post_uno.likes_counter).to eq 1
    end
  end
end
