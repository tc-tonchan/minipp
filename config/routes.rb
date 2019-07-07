Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  # get 'tweets'     => 'tweets#index'
  # post 'tweets' => 'tweets#create'
  # get '/tweets/:id/edit' => 'tweets#edit'
  resources :users, only: [:index, :edit, :update, :show] 
  resources :tweets
end
