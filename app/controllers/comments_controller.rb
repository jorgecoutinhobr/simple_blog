class CommentsController < ApplicationController
  include Verifiable

  before_action :set_post, only: %i[create destroy]
  before_action :set_comment, only: %i[destroy]
  before_action :verify_permission, only: %i[destroy]

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user if user_signed_in?

    if @comment.save
      flash[:notice] = t("text.save_success")
      redirect_to post_path(@post)
    else
      flash[:alert] = @comment.errors.full_messages.join(" - ")
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = t("text.delete_success")
    redirect_to post_path(@post)
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end
    def resource_user
      @comment.user
    end
end
