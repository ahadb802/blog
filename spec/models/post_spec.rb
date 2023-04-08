require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    Post.new(
      author: User.new(name: 'Juan', photo: 'https//myphoto.png', bio: 'this is my bio', posts_counter: 5),
      title: 'Hello',
      text: 'my text',
      comments_counter: 6,
      likes_counter: 5
    )
  end

  before { subject.save }

  it 'title shoud be present' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'title shoud be present' do
    subject.title = 'Juan'
    expect(subject).to be_valid
  end
  it 'title shoud be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title length shoud not exceed 250 chars' do
    subject.title = 'j' * 251
    expect(subject).to_not be_valid
  end

  it 'comments_counter shoud be >=0' do
    subject.comments_counter = -5
    expect(subject).to_not be_valid
  end
  it 'comments_counter shoud be integer >=0' do
    subject.comments_counter = 5.09
    expect(subject).to_not be_valid
  end

  it 'likes_counter shoud be >=0' do
    subject.likes_counter = -5
    expect(subject).to_not be_valid
  end
  it 'likes_counter shoud be integer >=0' do
    subject.likes_counter = 6.08
    expect(subject).to_not be_valid
  end

  describe '#newest_comments' do
    it 'should return the last five comments' do
      second_comment = Comment.create(author: subject.author, post: subject, text: 'second seed comment')
      third_comment = Comment.create(author: subject.author, post: subject, text: 'third seed comment')
      fourth_comment = Comment.create(author: subject.author, post: subject, text: 'fourth seed comment')
      fifth_comment = Comment.create(author: subject.author, post: subject, text: 'fifth seed comment')
      sixth_comment = Comment.create(author: subject.author, post: subject, text: 'First seed comment')
      last_comments = [sixth_comment, fifth_comment, fourth_comment, third_comment, second_comment]

      expect(subject.newest_comments).to eq last_comments
    end
  end
end
