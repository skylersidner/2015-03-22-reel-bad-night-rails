class FilmsController < ApplicationController
  include FilmsHelper

  def index
    @results = Film.all
  end
  
  def new
    @object = Film.new
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
      end
    end
  end



  #FOR REFERENCE FROM MINI RAILS PROJECT
  # def index
  #   @list = Dinner.all
  # end
  #
  # def new
  #   @dinner = Dinner.new
  # end
  #
  # def create
  #   @dinner = Dinner.new(params[:dinner])
  #   if @dinner.save
  #     redirect_to "/dinners/#{@dinner.id}"
  #   else
  #     render "new"
  #   end
  # end
  #
  # def show
  #   @dinner = Dinner.find_by_id(params[:id])
  # end
  #
  # def edit
  #   @dinner = Dinner.find_by_id(params[:id])
  # end
  #
  # def update
  #   @dinner = Dinner.find_by_id(params[:id])
  #   if @dinner.update_attributes(params[:dinner])
  #     redirect_to "/dinners/#{@dinner.id}"
  #   else
  #     render "edit"
  #   end
  # end
  #
  # def delete
  #   @dinner = Dinner.find_by_id(params[:id])
  #   @dinner.destroy
  #   redirect_to "/dinners"
  # end

end
