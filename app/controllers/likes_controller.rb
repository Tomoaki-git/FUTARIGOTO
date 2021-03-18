class LikesController < ApplicationController
  def create
    @like = Like.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end
end