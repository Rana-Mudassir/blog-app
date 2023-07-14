require 'rails_helper'
require 'capybara/rspec'

url = 'http://127.0.0.1:3000/'

RSpec.describe 'show', type: :feature, js: false do
  let!(:user) do
    User.create!(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/man-person-standing-between-tall-trees-F_-0BxGuVvo',
      bio: 'Teacher from Mexico.'
    )
  end

  let!(:post) do
    Post.create!(
      author_id: user.id,
      title: 'Hello',
      text: 'This is my first post'
    )
  end

  let!(:post2) do
    Post.create!(
      author_id: user.id,
      title: 'Greetings',
      text: 'I wanted to say hello to everyone!'
    )
  end

  let!(:post3) do
    Post.create!(
      author_id: user.id,
      title: 'Travel Adventures',
      text: 'Sharing my travel experiences around the world.'
    )
  end

  let!(:post4) do
    Post.create!(
      author_id: user.id,
      title: 'Favorite Recipes',
      text: 'Here are some of my favorite recipes to try out.'
    )
  end

  before(:each) do
    visit user_path(user.id)
  end

  describe 'show page' do
    it 'shows the name and profile photo of the user' do
      expect(page).to have_content(user.name)
    end

    it 'displays the number of posts for a user' do
      expect(page).to have_content('Number of posts: 4')
    end

    it 'displays the user bio' do
      expect(page).to have_content(user.bio)
    end

    it 'should have a button to see all posts' do
      expect(page).to have_link('See all posts')
    end
  end
end
