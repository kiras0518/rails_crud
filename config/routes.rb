Rails.application.routes.draw do
  #root :to => 'candidates#index'
  #resources :task
  root :to => 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  ##resources :candidates do
    #member do
     # post :vote
    #end
  #end
end
