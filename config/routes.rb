Rails.application.routes.draw do

  resource :recognitions, only: [:new, :create, :destroy]
  resources :customers
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy] do
    get :cart, on: :collection
    put :new, on: :collection
  end

end
