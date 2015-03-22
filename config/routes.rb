ReelBadNightRails::Application.routes.draw do

  #root to: 'to_be_decided#homepage'
  
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
  # # Destroy
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
  # # Destroy
  delete "/events/:id" => 'events#delete', :as => "event"
  

  #FOR REFERENCE FROM MINI RAILS PROJECT
  # root to: 'dinners#homepage'
  #
  # # Index
  # get "/dinners" => 'dinners#index', :as => "dinners"
  # # New
  # get "/dinners/new" => 'dinners#new', :as => "new_dinner"
  # # Create
  # post "/dinners" => 'dinners#create', :as => "dinners"
  # # Show
  # get "/dinners/:id" => 'dinners#show', :as => "dinner"
  # # Edit
  # get "/dinners/:id/edit" => 'dinners#edit', :as => "edit_dinner"
  # # Update
  # put "/dinners/:id" => 'dinners#update', :as => "dinner"
  # # # Destroy
  # delete "/dinners/:id" => 'dinners#delete', :as => "dinner"

end
