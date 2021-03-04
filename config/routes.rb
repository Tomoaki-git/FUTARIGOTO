Rails.application.routes.draw do
  root to: "posts#top"
  devise_for :users
  resources :posts do
    collection do
      get 'top'
    end
  end
end
