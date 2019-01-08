Rails.application.routes.draw do

  get '/ajax/justnow' => 'mokus#justnow'
  get 'accounts/:user_id' => 'accounts#edit'
  patch 'accounts/:user_id' => 'accounts#update'

  devise_for :users
  get 'users/:user_id/works/:work_id/public' => 'work#for_public'
  delete 'work/:id/images/:image_id' => 'work#delete_image'

  get 'mypage/:user_id/edit' => 'mypage#edit'
  get 'mypage/:user_id' => 'mypage#show'
  get 'mypage' => 'mypage#index'
  # ↑application_controllerのafter_sign_in_path_for(resource)メソッドでログイン後はここがデフォになってるからuser_idはなくても大丈夫
  patch 'mypage/:user_id' => 'mypage#update'

  get 'tags/:tag'=> 'faqs#index', as: :tag
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
  post '/users/:user_id/mokus/:moku_id/work' => 'work#create'

  post '/users/:user_id/works/:work_id/book_marks' => 'book_marks#create'
  delete '/users/:user_id/works/:work_id/book_marks' => 'book_marks#destroy'

  resources :users do
    resources :mokus, :moku_type, :work, :book_marks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmls
end
