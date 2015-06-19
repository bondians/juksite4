Rails.application.routes.draw do

root to: 'selections#index'

resources :plentries
resources :playlists
resources :sonviews
resources :currentsongs
resources :songtypes
resources :selections
resources :settings
resources :nextsongs
  

get 'songs/pick/:id', to: "songs#pick#:id"
resources :songs
resources :albums
resources :artists
resources :genres

post 'selections_dispatch/dispatch', to: 'selections_dispatch#dispatch'

get 'apids', to: 'apids#index'
post 'apids/update', to: 'apids#update'


#connect ':controller/:action/:id'
#connect ':controller/:action/:id.:format'
end
