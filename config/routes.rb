FakeTower::Application.routes.draw do

  resources :teams

  resources :projects, :except => :destroy do
  	resources :messages, :except => :destroy
  	resources :task_lists
  	resources :todos
  end

  resources :comments

  root :to => 'home#index'
  
  devise_for :members
end
