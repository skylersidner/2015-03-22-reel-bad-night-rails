class DrinksController < ApplicationController

  def index
    @results = Drink.all
  end
  
  def new

  end
  
  def create

  end
  
  def show

  end
  
  def edit

  end
  
  def update

  end
  
  def delete

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
