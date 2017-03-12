Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'password/new' => 'password#new'
  get 'password/:size' => 'password#show'
end
