require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: post.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: post.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Post' do
        binding.pry
        expect {
          post :create, params: {  post: attributes_for(:post, user: user) }
        }.to change(Post, :count).by(1)
      end

      it 'redirects to the created post' do
        post :create, params: { post: attributes_for(:post) }
        expect(response).to redirect_to(Post.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new" template)' do
        post :create, params: { post: attributes_for(:post, title: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        { title: 'Updated Title', body: 'Updated Body' }
      }

      it 'updates the requested post' do
        put :update, params: { id: post.id, post: new_attributes }
        post.reload
        expect(post.title).to eq('Updated Title')
        expect(post.body).to eq('Updated Body')
      end

      it 'redirects to the post' do
        put :update, params: { id: post.id, post: new_attributes }
        expect(response).to redirect_to(post)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "edit" template)' do
        put :update, params: { id: post.id, post: attributes_for(:post, title: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested post' do
      post_to_delete = create(:post, user: user)
      expect {
        delete :destroy, params: { id: post_to_delete.id }
      }.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts list' do
      delete :destroy, params: { id: post.id }
      expect(response).to redirect_to(root_path)
    end
  end
end
