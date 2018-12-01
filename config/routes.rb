Rails.application.routes.draw do

  get "/" => 'users#index'
  get '/users/:user_id/mokus/:id/new' => 'work#new'
  post '/users/:user_id/mokus/:id/create' => 'work#create'

  resources :users do
    resources :mokus, :moku_type, :work, :book_marks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmls
end
