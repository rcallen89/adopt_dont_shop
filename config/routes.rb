Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/', to: 'welcome#index'
get '/shelters', to: 'shelters#index'
get '/shelters/new', to: 'shelters#new'
get '/shelters/:id', to: 'shelters#show'
post '/shelters', to: 'shelters#create'
get '/shelters/:id/pets', to: 'shelters#pets'
get '/shelters/:id/pets/new', to: 'pets#new'
get '/shelters/:id/edit', to: 'shelters#edit'
patch '/shelters/:id', to: 'shelters#update'
delete '/shelters/:id', to: 'shelters#delete'

get '/pets', to: 'pets#index'
get '/pets/:id', to: 'pets#show'
get '/pets/:id/edit', to: 'pets#edit'
patch '/pets/:id/edit', to: 'pets#update'
post '/shelters/:shelter_id/pets/new', to: 'pets#create'
delete '/pets/:id', to: 'pets#delete'
end
