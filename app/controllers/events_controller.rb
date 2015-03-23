class EventsController < ApplicationController


  def index
    @results = Event.all
  end
  
  def new
    @object = Event.new
  end
  
  def create
    @object = Event.new(params[:event])
    if @object.save
      redirect_to "/events/#{@object.id}"
    else      
      render "new"
    end
  end
  
  def show
    @object = Event.find_by_id(params[:id])
  end
  
  def edit
    @object = Event.find_by_id(params[:id])
  end
  
  def update
    @object = Event.find_by_id(params[:id])
    if @object.update_attributes(params[:event])
      redirect_to "/events/#{@event.id}"
    else      
      render "edit"
    end
  end
  
  def delete
    @object = Event.find_by_id(params[:id])
    @object.destroy
    redirect_to "/events"
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
