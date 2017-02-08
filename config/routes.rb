Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:new, :create, :index]
  end

  resources :songs, only: [:show, :edit, :update]

  resources :playlists
end
