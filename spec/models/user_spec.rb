require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Juan',
      photo: 'https//myphoto.png',
      bio: 'this is my bio',
      posts_counter: 5
    )
  end

  before { subject.save }

  it 'name shoud be present' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'name shoud be present' do
    subject.name = 'Juan'
    expect(subject).to be_valid
  end
  it 'name shoud be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name length shoud not exceed 250 chars' do
    subject.name = 'j' * 251
    expect(subject).to_not be_valid
  end

  it 'post_counter shoud be >=0' do
    subject.posts_counter = -5
    expect(subject).to_not be_valid
  end

  it 'post_counter shoud be integer >=0' do
    subject.posts_counter = 5.09
    expect(subject).to_not be_valid
  end
  describe '#newest_posts' do
    it 'should return the last three posts' do
      second_post = Post.create(author: subject, title: 'Second seed post', text: 'Lorem Ipsum is simply dummy text.',
                                comments_counter: 2, likes_counter: 2)
      third_post = Post.create(author: subject, title: 'Third seed post', text: 'Lorem Ipsum is simply dummy text.',
                               comments_counter: 2, likes_counter: 2)
      fourth_post = Post.create(author: subject, title: 'Fourth seed post', text: 'Lorem Ipsum is simply dummy text.',
                                comments_counter: 2, likes_counter: 2)
      last_posts = [fourth_post, third_post, second_post]

      expect(subject.newest_posts).to eq last_posts
    end
  end
end
