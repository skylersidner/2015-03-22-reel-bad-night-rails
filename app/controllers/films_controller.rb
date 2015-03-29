class FilmsController < ApplicationController
  include FilmsHelper
  include LoginsHelper

  before_filter :check_for_admin, only: [:new]

  def index
    @results = Film.all
  end
  
  def new
    if params["title"] != nil
      @object = Film.new("title"=>params["title"], "year"=>params["year"], "length"=>params["length"], "synopsis"=>params["synopsis"], "rt_rating"=>params["rt_rating"])
    else
      @object = Film.new
    end
  end
  
  def create
    @object = Film.new(params[:film])
    if @object.save
      redirect_to "/films/#{@object.id}"
    else      
      render "new"
    end
  end
  
  def show
    @object = Film.find_by_id(params[:id])
  end
  
  def edit
    @object = Film.find_by_id(params[:id])
  end
  
  def update
    @object = Film.find_by_id(params[:id])
    if @object.update_attributes(params[:film])
      redirect_to "/films/#{@object.id}"
    else      
      render "edit"
    end
  end
  
  def delete
    @object = Film.find_by_id(params[:id])
    @object.destroy
    redirect_to "/films"
  end
  
  def search_rt
    @thumbs = []
    @results = []
    if params[:search] != nil
      get_rt_search_results #helper
      if @results.count == 0
        @no_results = true
      end #count
    end #if
  end #method

end
