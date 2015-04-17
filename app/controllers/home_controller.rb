class HomeController < ApplicationController

  def homepage
    # fetch the events by descending start_time order
    @current_event = Event.order('start_time DESC')[0]
    if @current_event != nil
      @current_film = Film.find_by_id(@current_event.film_id)
    end
    
    @previous_event = Event.order('start_time DESC')[1]
    if @previous_event != nil
      @previous_film = Film.find_by_id(@previous_event.film_id)
    end    
  end
  
end
