class HomeController < ApplicationController

  def homepage
    @current_event = Event.find_by_current_event(2)
    if @current_event != nil
      @current_film = Film.find_by_id(@current_event.film_id)
    end
    @previous_event = Event.find_by_current_event(1)
    if @previous_event != nil
      @previous_film = Film.find_by_id(@previous_event.film_id)
    end
  end
  
end
