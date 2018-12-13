Rails.application.routes.draw do

  get 'administrator/index'
  devise_for :users
  get 'faqs/index'
  get 'faqs/:id/show' =>'faqs#show'
  get root to: 'top#index'
  get "top/about" => "top#about"
  # get 'users/:id' => 'users#index'
  # ↑試しに追加してみた。
  get '/users/:user_id/mokus/:id/work/new' => 'work#new'
  post '/users/:user_id/mokus/:id/work/create' => 'work#create'

  resources :users do
    resources :mokus, :moku_type, :work, :book_marks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmls
end
