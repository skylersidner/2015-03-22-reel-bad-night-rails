class ApplicationController < ActionController::Base
  include LoginsHelper
  
  protect_from_forgery

  before_filter :check_for_admin, only: [:edit]
  before_filter :get_user
  
  
  private
  
  def get_user
    if session[:user] != nil
      @user = Patron.find_by_id(session[:user])
    else
      no_user
    end
  end

end
