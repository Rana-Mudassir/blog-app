require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @user = User.create(name: 'Tom', id: 5)
  end
  describe 'GET #index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include('<span>Number of posts: 1</span>')
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get user_path(@user.id)
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      get user_path(@user.id)
      expect(response).to render_template(:show)
    end

    it 'should include correct placeholder' do
      get user_path(@user.id)
      expect(response.body).to include('<h2>Tom</h2>')
    end
  end
end
