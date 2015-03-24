class LoginsController < ApplicationController
  include LoginsHelper

  def login

  end
  
  def validate
    @user = Patron.find_by_username(params[:username])
    if @user == nil || @user.password != params[:password]
      flash[:failed] = "Login Failed!"
      redirect_to "/login"
    end
    session[:user] = @user.id
    flash[:success] = "Login Successful!"
    redirect_to "/patrons/#{@user.id}"
  end
  
  def logout
    no_user #helper
    flash[:logout] = "Logged Out!"
    redirect_to "/login"
  end


end
