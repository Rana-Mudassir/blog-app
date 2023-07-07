require 'rails_helper'

# RSpec.describe "Posts", type: :request do
#   describe "GET /posts" do
#     it "works! (now write some real specs)" do
#       get posts_index_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get '/users/1/posts'
      expect(response.body).to include('<h1>Here is a list of posts for a given user</h1>')
    end
  end

  describe 'GET #show' do
    let(:post) { create(:post) }

    it 'returns a successful response' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get '/users/1/posts/1'
      expect(response.body).to include('<h1>Here is a Specific post for a given User Id</h1>')
    end
  end
end