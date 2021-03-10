class PostsController < ApplicationController

  def top
    
  end

  def index
    @post = Post.all.order(created_at: :DESC)
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
  end

  private

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
    .merge(
      user_id: current_user.id
    )
  end
end
