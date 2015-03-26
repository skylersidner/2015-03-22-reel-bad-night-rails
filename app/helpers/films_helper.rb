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
    search_results = RottenMovie.find(:title => "#{params[:search]}", :limit => 20)
    if search_results.length == nil #check if search returned a single object
      search_results = [search_results] #make it an array
    end
    search_results.each do |x| #capture relevant info from rottentomatoes
      film = Film.new("title"=>"#{x.title}", "year"=>"#{x.year}", "length"=>"#{x.runtime}", "synopsis"=>"#{x.synopsis}", "trailer"=>"", "rt_rating"=>"#{x.ratings.critics_score}")
      @results << film
      
      if x.posters.thumbnail == nil
        @thumbs << "../images/poster_default.gif"
      else
        @thumbs << x.posters.thumbnail
      end #if
    end #each
    @results
  end #method

end
