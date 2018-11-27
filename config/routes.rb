Rails.application.routes.draw do
  get "/" => 'users#index'

  resources :users do
    resources :mokus, :moku_type, :work
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmls
end
