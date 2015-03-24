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

end
