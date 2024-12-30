class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :verify_permission, only: %i[ edit update destroy ]

  def index
    if params[:tag].present?
      @pagy, @posts = pagy(
        Post.most_recent
          .includes(:tags)
          .joins(:tags)
          .where(tags: { name: params[:tag] }),
        items: 3
      )
    else
      @pagy, @posts = pagy(Post.most_recent, items: 3)
    end
  end

  def show
    @comments = @post.comments.most_recent
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to @post, notice: t("text.post_created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: t("text.post_updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!

    redirect_to root_path, status: :see_other, notice: t("text.post_deleted")
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, tag_ids: [])
  end

  def resource_user
    @post.user
  end
end
