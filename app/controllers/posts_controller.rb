class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_q, only: [:index, :search]
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def top
  end

  def index
    @posts = Post.includes(:user, :choice_counts).order(created_at: :DESC).page(params[:page]).per(12)
    @choice_counts = []
      @posts.each do |post|
        @choice_counts << post.user_id
      end
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
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    choices = @post.choice_counts
    @choice_counts = []
    choices.each do |count|
      @choice_counts << count.user_id
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.save
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to action: :index
  end

  def search
    @results = @q.result
  end

  private

  def set_params
    @post = Post.find(params[:id])
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

  def set_q
    @q = Post.ransack(params[:q])
  end

end
