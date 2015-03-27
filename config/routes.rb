ReelBadNightRails::Application.routes.draw do

  root to: 'home#homepage'
  
  # Index
  get "/drinks" => 'drinks#index', :as => "drinks"
  # New
  get "/drinks/new" => 'drinks#new', :as => "new_drink"
  # Create
  post "/drinks" => 'drinks#create', :as => "drinks"
  # Show
  get "/drinks/:id" => 'drinks#show', :as => "drink"
  # Edit
  get "/drinks/:id/edit" => 'drinks#edit', :as => "edit_drink"
  # Update
  put "/drinks/:id" => 'drinks#update', :as => "drink"
  # Destroy
  delete "/drinks/:id" => 'drinks#delete', :as => "drink"

  # Index
  get "/events" => 'events#index', :as => "events"
  # New
  get "/events/new" => 'events#new', :as => "new_event"
  # Create
  post "/events" => 'events#create', :as => "events"
  # Show
  get "/events/:id" => 'events#show', :as => "event"
  # Edit
  get "/events/:id/edit" => 'events#edit', :as => "edit_event"
  # Update
  put "/events/:id" => 'events#update', :as => "event"
  # Destroy
  delete "/events/:id" => 'events#delete', :as => "event"
  
  # Index
  get "/films" => 'films#index', :as => "films"
  # New
  get "/films/new" => 'films#new', :as => "new_film"
  # Create
  post "/films" => 'films#create', :as => "films"
  # Show
  get "/films/:id" => 'films#show', :as => "film"
  # Edit
  get "/films/:id/edit" => 'films#edit', :as => "edit_film"
  # Update
  put "/films/:id" => 'films#update', :as => "film"
  # Destroy
  delete "/films/:id" => 'films#delete', :as => "film"
  
  get "/films/0/search_rt" => 'films#search_rt'
  
  # Index
  get "/patrons" => 'patrons#index', :as => "patrons"
  # New
  get "/patrons/new" => 'patrons#new', :as => "new_patron"
  # Create
  post "/patrons" => 'patrons#create', :as => "patrons"
  # Show
  get "/patrons/:id" => 'patrons#show', :as => "patron"
  # Edit
  get "/patrons/:id/edit" => 'patrons#edit', :as => "edit_patron"
  # Update
  put "/patrons/:id" => 'patrons#update', :as => "patron"
  # Destroy
  delete "/patrons/:id" => 'patrons#delete', :as => "patron"
  
  
  get "/login" => 'logins#login'
  
  post "/validate" => 'logins#validate'
  
  get "/logout" => 'logins#logout'
  
  get "/retrieval" => 'logins#retrieval'
  
  post "/reset" => 'logins#reset'
  
  post "/get_username" => 'logins#get_username'
  
  
  get "/search" => 'search#search'
  
  get "/search/events" => 'search#events'
  
  get "/search/patrons" => 'search#patrons'
  
  get "/search/drinks" => 'search#drinks'
  
  get "/search/films" => 'search#films'
  
  get "/search/events/results" => 'search#events_results'
  
  get "/search/patrons/results" => 'search#patrons_results'
  
  get "/search/drinks/results" => 'search#drinks_results'
  
  get "/search/films/results" => 'search#films_results'

end
