class ChoiceCountsController < ApplicationController
  before_action :authenticate_user!, only: [:create_first, :create_second, :create_third]

  def create_first
    choice_count = ChoiceCount.new
    choice_count[:first_choice_count] = 1
    choice_count[:second_choice_count] = 0
    choice_count[:third_choice_count] = 0
    choice_count[:post_id] = params[:post_id]
    choice_count[:user_id] =  current_user.id
    choice_count.save
    redirect_to "/posts/#{params[:post_id]}"
  end

  def create_second
    choice_count = ChoiceCount.new
    choice_count[:first_choice_count] = 0
    choice_count[:second_choice_count] = 1
    choice_count[:third_choice_count] = 0
    choice_count[:post_id] = params[:post_id]
    choice_count[:user_id] =  current_user.id
    choice_count.save
    redirect_to "/posts/#{params[:post_id]}"
  end

  def create_third
    choice_count = ChoiceCount.new
    choice_count[:first_choice_count] = 0
    choice_count[:second_choice_count] = 0
    choice_count[:third_choice_count] = 1
    choice_count[:post_id] = params[:post_id]
    choice_count[:user_id] =  current_user.id
    choice_count.save
    redirect_to "/posts/#{params[:post_id]}"
  end

end
