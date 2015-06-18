Rails.application.routes.draw do
  root to: 'selections#index'

resources :riches

resources :plentries

resources :playlists


resources :sonviews
resources :currentsongs
resources :songtypes
resources :selections
resources :settings
resources :nextsongs
  
resources :apids

get 'songs/pick/:id', to: "songs#pick#:id"
resources :songs

resources :albums

resources :artists

resources :genres

post 'selections_dispatch/dispatch', to: 'selections_dispatch#dispatch'



#connect ':controller/:action/:id'
#connect ':controller/:action/:id.:format'
end
