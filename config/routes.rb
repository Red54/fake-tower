FakeTower::Application.routes.draw do

  resources :task_lists

  resources :teams

  resources :projects, :except => :destroy

  resources :messages

  resources :todos

  resources :comments

  root :to => 'home#index'
  
  devise_for :members
end
