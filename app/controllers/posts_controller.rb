class PostsController < ApplicationController
  def top
    
  end

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post.create
    if @post.save
      redirect_to :index
    else
      render :new
    end
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
    .merge(user_id: current_user.id)
  end
end
