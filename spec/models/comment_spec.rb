require 'rails_helper'

RSpec.describe Comment, type: :model do
  author_uno = User.create(name: 'Juan', photo: 'http://jun.png', bio: 'Engineer', posts_counter: 5)
  post_uno = Post.create(author: author_uno, title: 'First post', text: 'Lorem Ipsum', comments_counter: 0,
                         likes_counter: 0)

  context 'When testing update_comment_counter method' do
    it 'should update the post comments_counter after create a comment' do
      Comment.create(post: post_uno, author: author_uno, text: 'hello world')
      Comment.create(post: post_uno, author: author_uno, text: 'hello world')
      Comment.create(post: post_uno, author: author_uno, text: 'hello world')
      expect(post_uno.comments_counter).to eq 3
    end
  end
end
