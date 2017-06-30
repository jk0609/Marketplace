Rails.application.routes.draw do
  resources :products do
    resources :reviews
  end

  resources :splash, :only=>[:index]
  root :to => 'splash#index'
end
