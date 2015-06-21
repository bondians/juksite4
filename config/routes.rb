Rails.application.routes.draw do

root to: 'selections#index'

resources :plentries
resources :playlists
resources :sonviews
resources :currentsongs
resources :songtypes
resources :selections

resources :nextsongs

get  'settings', to: "settings#index"
post 'settings/action', to: "settings#action"
post 'settings', to: "settings#update"
post 'settings/setvolume', to: "settings#setvolume"

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
