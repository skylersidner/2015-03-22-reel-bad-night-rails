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
    redirect_to "/login"
  end
  
  def retrieval
  end

  def reset
    if @user = Patron.find_by_username(params[:username])
      # currently set to private email; NEEDS TO BE ROUTED TO DEDICATED PROJECT EMAIL!!!!!!!!!
      Pony.mail(:to => "#{@user.email}", :from => "malevolentdragon@gmail.com", :subject => "TESTING", :body => "If your'e reading this, it worked.")
      random_password = Array.new(10).map { (65 + rand(58)).chr }.join
      @user.password = random_password
      @user.save
    end
  end
  
  def get_username
    
  end

end
