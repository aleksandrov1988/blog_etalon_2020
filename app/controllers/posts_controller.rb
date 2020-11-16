class PostsController < ApplicationController
  before_action :check_authentication, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_edit, only: [:edit, :update, :destroy]
  after_action :increment_views_count, only: :show

  # GET /posts
  def index
    @posts = Post.includes(:user).ordering.page(params[:page])
  end

  # GET /posts/1
  def show
    @post = Post.includes(:user, comments: :user).find(params[:id])
    @comment = Comment.new(post: @post)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user = @current_user
    if @post.save
      redirect_to @post, notice: t('.success')
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: t('.success')
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_path, notice: t('.success')
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:body, :title)
  end

  def check_edit
    render_error unless @post.edit_by?(@current_user)
  end

  def increment_views_count
    @post.increment!(:views_count)
  end
end
