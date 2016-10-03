Rails.application.routes.draw do
  resources :notes
  resources :notebooks
  resources :profiles, defaults: { format: :json } do
    collection do
      get :current
    end
  end
  devise_for :users
  root "pages#home"
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
