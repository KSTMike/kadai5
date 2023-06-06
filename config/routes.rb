Rails.application.routes.draw do
  get 'stocks', to: 'stocks#index'
  resources :posts do
    collection do
      post :confirm
    end
  end
end
