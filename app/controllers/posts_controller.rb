class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_q, only: [:index, :search]

  def top
  end

  def index
    @posts = Post.includes(:user, :choice_counts).order(created_at: :ASC).page(params[:page]).per(12)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to action: :index
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Post.ransack(params[:q])
  end

  def post_params
    params.require(:post)
    .permit(
      :title,
      :content,
      :first_choice,
      :second_choice,
      :third_choice,
      :comment
    )
    .merge(user_id: current_user.id)
  end
end
