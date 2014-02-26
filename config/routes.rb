Blog::Application.routes.draw do

  get 'log in' => 'sessions#new', as: 'log_in'
  get 'log_out' => 'sessions#destroy', as: 'log_out'
  get 'sign_up' => 'users#new', as: 'sign_up'
  resources :users
  resource :sessions

  resources :posts do
    resources :comments
  end

  root 'welcome#index'

end
