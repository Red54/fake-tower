FakeTower::Application.routes.draw do

  resources :teams, only: :show

  resources :projects, except: :destroy do

  	resources :messages, only: [:index, :show, :new, :create] do
  		member do
  			post 'create_comment'
  		end
  	end

  	resources :task_lists, only: [:index, :show, :new, :create, :destroy]

  	resources :todos

  end

  root :to => 'home#index'
  
  devise_for :members
end
