Rails.application.routes.draw do
    get 'stocks', to: 'stocks#index'
    resources :posts
    collection do
      post :confirm
    end
  end
end