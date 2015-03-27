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
    if params[:patron][:password] == ""
      @object.password = params[:patron][:password]
    end
    
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

end
