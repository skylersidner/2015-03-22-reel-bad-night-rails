class ApplicationController < ActionController::Base
  include LoginsHelper
  
  protect_from_forgery

  before_filter :check_for_admin, only: [:new, :create, :edit]
  before_filter :get_user
  
  
  private
 
  def check_for_admin
    @user = Patron.find_by_id(session[:user])
    if @user == nil || @user.username != "Admin"
      flash[:denied] = "You must be logged in as an Administrator to edit or create."
      redirect_to "/login"
    end
  end
  
  def get_user
    if session[:user] != nil
      @user = Patron.find_by_id(session[:user])
    else
      no_user
    end
  end

end
