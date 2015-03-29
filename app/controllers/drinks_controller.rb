class DrinksController < ApplicationController
  include LoginsHelper

  before_filter :check_for_admin, only: [:new]

  def index
    @results = Drink.all
  end
  
  def new
    @object = Drink.new
  end
  
  def create
    @object = Drink.new(params[:drink])
    if @object.save
      redirect_to "/drinks/#{@object.id}"
    else      
      render "new"
    end
  end
  
  def show
    @object = Drink.find_by_id(params[:id])
  end
  
  def edit
    @object = Drink.find_by_id(params[:id])
  end
  
  def update
    @object = Drink.find_by_id(params[:id])
    if @object.update_attributes(params[:drink])
      redirect_to "/drinks/#{@object.id}"
    else      
      render "edit"
    end
  end
  
  def delete
    @object = Drink.find_by_id(params[:id])
    @object.destroy
    redirect_to "/drinks"
  end

end
