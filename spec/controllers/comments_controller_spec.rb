require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:tag) { create(:tag) }
  let(:new_post) { create(:post, user: user, tags: [ tag ]) }
  let(:comment) { create(:comment, post: new_post, user: user) }

  describe 'POST #create' do
    context 'when user is signed in' do
      before { sign_in user }

      it 'creates a new comment' do
        expect {
          post :create, params: { post_id: new_post.id, comment: { body: 'This is a comment' } }
        }.to change(Comment, :count).by(1)

        expect(response).to redirect_to(post_path(new_post))
      end

      it 'does not create a comment with invalid params' do
        expect {
          post :create, params: { post_id: new_post.id, comment: { body: '' } }
        }.not_to change(Comment, :count)
        expect(flash[:alert]).to be_present
        expect(response).to redirect_to(post_path(new_post))
      end
    end

    context 'when user is not signed in' do
      it 'creates a new comment without user' do
        expect {
          post :create, params: { post_id: new_post.id, comment: { body: 'This is a comment' } }
        }.to change(Comment, :count).by(1)
        expect(Comment.last.user).to be_nil
        expect(flash[:notice]).to eq(I18n.t("text.save_success"))
        expect(response).to redirect_to(post_path(new_post))
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is signed in' do
      before { sign_in user }

      it 'deletes the comment' do
        comment
        expect {
          delete :destroy, params: { post_id: new_post.id, id: comment.id }
        }.to change(Comment, :count).by(-1)
        expect(flash[:notice]).to eq(I18n.t("text.delete_success"))
        expect(response).to redirect_to(post_path(new_post))
      end
    end

    context 'when user is not signed in' do
      it 'does not delete the comment' do
        comment
        expect {
          delete :destroy, params: { post_id: new_post.id, id: comment.id }
        }.not_to change(Comment, :count)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
