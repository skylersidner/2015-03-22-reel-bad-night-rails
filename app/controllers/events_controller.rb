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
      redirect_to "/events/#{@object.id}"
    else      
      render "edit"
    end
  end
  
  def delete
    @object = Event.find_by_id(params[:id])
    @object.destroy
    redirect_to "/events"
  end

end
