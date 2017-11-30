Rails.application.routes.draw do

  # resources :frames, except: :index
  resources :users
  resources :games do
  	resources :frames
  end

  # get 'games/:id/frames' => 'frames#index', as: 'game_frames'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
