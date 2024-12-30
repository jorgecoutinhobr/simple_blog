require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  resources :posts do
    resources :comments, only: [ :create, :destroy ]
  end

  devise_for :users

  resources :file_uploads, only: [ :new, :create ]

  root "posts#index"
end
