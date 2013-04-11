FakeTower::Application.routes.draw do

  resources :teams

  resources :projects, except: :destroy do

  	resources :messages, only: [:index, :show, :new, :create] do
  		member do
  			post 'create_comment'
  		end
  	end

  	resources :task_lists

  	resources :todos

  end

  root :to => 'home#index'
  
  devise_for :members
end
