class PatronsController < ApplicationController


  def index
    @results = Patron.all
  end
  
  def new
    @object = Patron.new
  end
  
  def create
    @object = Patron.new(params[:patron])
    if @object.save
      redirect_to "/patrons/#{@object.id}"
    else      
      render "new"
    end
  end
  
  def show
    @object = Patron.find_by_id(params[:id])
  end
  
  def edit
    @object = Patron.find_by_id(params[:id])
  end
  
  def update
    @object = Patron.find_by_id(params[:id])
    if @object.update_attributes(params[:patron])
      redirect_to "/patrons/#{@object.id}"
    else      
      render "edit"
    end
  end
  
  def delete
    @object = Patron.find_by_id(params[:id])
    @object.destroy
    redirect_to "/patrons"
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
