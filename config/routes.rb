FakeTower::Application.routes.draw do
  resources :teams


  resources :projects


  resources :messages


  resources :todos


  resources :comments


  root :to => 'home#index'
  devise_for :members
end
