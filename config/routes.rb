Rails.application.routes.draw do
  get 'choice_counts/create'
  get 'likes/new'
  get 'likes/create'
  root to: "posts#top"
  devise_for :users
  resources :posts do
    collection do
      get 'top'
      get 'search'
    end
    resources :comments, only: :create
    resources :likes, only: :create
    # resources :choice_counts, only: :create
    resources :choice_counts do
      collection do
        post 'create_first'
        post 'create_second'
        post 'create_third'
      end
    end
  end
  resources :users, only: :show
end

