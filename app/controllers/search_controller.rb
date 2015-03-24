class SearchController < ApplicationController
  
  def search
  end

  def events
  end

  def patrons
  end
  
  def drinks
  end
  
  def films
  end
  
  
  def events_results
    @results = Event.where params["field"] => params["value"]
  end
  
  def patrons_results
    @results = Patron.where params["field"] => params["value"]
  end
  
  def drinks_results
    @results = Drink.where params["field"] => params["value"]
  end
  
  def films_results
    @results = Film.where params["field"] => params["value"]
  end

end
