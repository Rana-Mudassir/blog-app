require 'capybara/rspec'
require 'rails_helper'

RSpec.describe 'User profile page', type: :feature do
  before do
    @user = User.create(
      name: 'Tom',
      photo: 'https://media.istockphoto.com/id/1289461328/photo/portrait-of-a-handsome-black-man.jpg?s=612x612&w=0&k=20&c=y_mzB0Tbe5LErNy6pqfY7sz2HiDT7fOAUCwupN3-Bg4=',
      posts_counter: 5
    )
    @posts = [
      Post.create(author: @user, title: 'Hello', text: 'This is my first post', comments: []),
      Post.create(author: @user, title: 'Greetings', text: 'I wanted to say hello to everyone!', comments: [])
    ]
  end

  it 'displays the user profile information and posts' do
    visit user_posts_path(@user)

    expect(page).to have_selector('h2', text: @user.name)
    expect(page).to have_selector('img[src="https://media.istockphoto.com/id/1289461328/photo/portrait-of-a-handsome-black-man.jpg?s=612x612&w=0&k=20&c=y_mzB0Tbe5LErNy6pqfY7sz2HiDT7fOAUCwupN3-Bg4="]')

    @posts.each do |post|
      expect(page).to have_selector('h3', text: post.title)
      expect(page).to have_selector('.user-count span', text: "Comments: #{post.comments.count}")
      expect(page).to have_selector('.user-count span', text: "Likes: #{post.likes.count}")

      post.comments.each do |comment|
        expect(page).to have_selector('li', text: "#{comment.user.name}: #{comment.text}")
      end
    end
  end

  it 'displays the number of posts the user has written' do
    visit user_posts_path(@user)
    expect(page).to have_content('Number of posts: 2')
  end

  it 'displays part of the post body' do
    visit user_posts_path(@user)
    @posts.each do |post|
      expect(page).to have_content(post.text.truncate(180))
    end
  end

  it 'redirects to the post show page when clicking on a post' do
    visit user_posts_path(@user)
    click_link 'Hello'
    expect(current_path).to eq(user_post_path(@user, @posts.first))
  end
end
