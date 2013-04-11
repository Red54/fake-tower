FakeTower::Application.routes.draw do

  resources :teams, only: :show

  resources :projects do

  	resources :messages, only: [:index, :show, :new, :create] do
  		member do
  			post 'create_comment'
  		end
  	end

  	resources :task_lists, except: [:edit, :update]

  	resources :todos # The RESTful interface still in progress

  end

  root :to => 'home#index'
  
  devise_for :members
end
