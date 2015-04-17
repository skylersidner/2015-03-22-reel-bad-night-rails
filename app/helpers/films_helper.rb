module FilmsHelper

  # Public: #get_rt_search_results
  # Uses the rottentomatoes API gem to create Film objects out of
  # search results.
  #
  # Parameters: None
  #
  # Returns: An array of Film objects.
  #
  # State Changes: @results is populated with objects.
  def get_rt_search_results
    #use rotten-tomatoes gem to search for films based on title
    search_results = RottenMovie.find(:title => "#{params[:search]}", :limit => 20)

    #rotten-tomatoes gem is unpredictable; if the search gets nothing it returns an empty array; if it gets many things, they are returned in an array; but if it gets only one thing, it returns the RottenTomatoes object itself; this condition ensures that the method will always return an array;
    if search_results.length == nil #check if search returns a non-array object
      search_results = [search_results] #make it an array
    end
    
    #convert the information into an array of film objects
    search_results.each do |x|
      film = Film.new("title"=>"#{x.title}", "year"=>"#{x.year}", "length"=>"#{x.runtime}", "synopsis"=>"#{x.synopsis}", "trailer"=>"", "rt_rating"=>"#{x.ratings.critics_score}")
      @results << film
      
      #create an array of poster thumbnails; if a poster is unavailable, use a default image
      if x.posters.thumbnail == nil
        @thumbs << "../images/poster_default.gif"
      else
        @thumbs << x.posters.thumbnail
      end #if
      
    end #each
    @results
  end #method

end
