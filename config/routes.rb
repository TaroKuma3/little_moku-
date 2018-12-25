Rails.application.routes.draw do

  devise_for :users

  get 'mypage' => 'mypage#index'
  get 'mypage/:user_id' => 'mypage#show'
  get 'mypage/:user_id/edit' => 'mypage#edit'
  patch 'mypage/:user_id' => 'mypage#update'

  get 'administrator/index'

  get 'faqs'          => 'faqs#index'
  get 'faqs/new'      => 'faqs#new'
  get 'faqs/:id'      => 'faqs#show'
  get 'faqs/:id/edit' => 'faqs#edit'
  post 'faqs'         => 'faqs#create'
  patch 'faqs/:id'    => 'faqs#update'
  delete 'faqs/:id'   => 'faqs#destroy'

  get root to: 'top#index'
  get "top/about" => "top#about"

  get '/users/:user_id/mokus/:id/work/new' => 'work#new'
  post '/users/:user_id/mokus/:moku_id/work/create' => 'work#create'

  resources :users do
    resources :mokus, :moku_type, :work, :book_marks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmls
end
