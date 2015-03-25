class LoginsController < ApplicationController
  include LoginsHelper

  def login

  end
  
  def validate
    @errors = [] 
    if @user = Patron.find_by_username(params[:username])
      if @user.try(:authenticate, params[:password])
        session[:user] = @user.id
        flash[:success] = "Login Successful!"
        redirect_to "/patrons/#{@user.id}"
      else
        @errors << "Invalid Password"
        binding.pry
        render "login"
      end
    else
      @errors << "Invalid Username"
      render "login"
    end

  end
  
  def logout
    no_user #helper
    flash[:logout] = "Logged Out!"
    render "login"
  end


end
