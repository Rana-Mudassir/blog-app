require 'rails_helper'

RSpec.describe 'Post Details Section', type: :feature do
  before do
    @user = User.create(name: 'Tom')
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    Comment.create(user: @user, post: @post, text: 'Great lesson for everyone')
    visit user_post_path(@post.author, @post)
  end

  it 'displays the post details and comments' do
    within('.post-details') do
      expect(page).to have_selector('.user-count span', text: 'Comments: 1')
      expect(page).to have_selector('.user-count span', text: 'Likes: 0')
      expect(page).to have_selector('h2', text: @post.title)
      expect(page).to have_content(@user.name)
    end

    within('.comment') do
      fill_in 'Enter your comment', with: 'New comment'
      click_button 'Add Comment'
    end

    within('.like') do
      click_button 'Like'
    end
  end

  it 'displays the post body' do
    expect(page).to have_content(@post.text)
  end

  it 'displays each comment' do
    @post.comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  it 'displays the username of the commenter for each comment' do
    @post.comments.each do |comment|
      expect(page).to have_content(comment.user.name)
    end
  end
end
