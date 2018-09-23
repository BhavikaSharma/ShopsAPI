Rails.application.routes.draw do
  namespace :api do
    resources :shops do
      resources :orders do
        resources :line_items
      end
      resources :products
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
