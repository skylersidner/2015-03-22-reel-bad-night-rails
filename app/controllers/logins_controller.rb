class LoginsController < ApplicationController
  include LoginsHelper

  def login
  end
  
  def validate
    @messages = [] 
    if @user = Patron.find_by_username(params[:username])
      if @user.try(:authenticate, params[:password])
        session[:user] = @user.id
        flash[:success] = "Login Successful!"
        redirect_to "/patrons/#{@user.id}"
      else
        @messages << "Invalid Password"
        render "login"
      end
    else
      @messages << "Invalid Username"
      render "login"
    end

  end
  
  def logout
    no_user #helper
    flash[:logout] = "Logged Out!"
    redirect_to "/login"
  end
  
  def password
  end

  def reset
    @messages = []
    if @user = Patron.find_by_username(params[:username])
      random_password = Array.new(10).map { (65 + rand(58)).chr }.join
      @user.password = random_password
      @user.save
      # currently set to private email; NEEDS TO BE ROUTED TO DEDICATED PROJECT EMAIL!!!!!!!!!
      Pony.mail(:to => "#{@user.email}", :from => "malevolentdragon@gmail.com", :subject => "TESTING password", :body => "If you're reading this, password email worked. It should now be #{random_password}.")
      flash[:reset] = "Password Reset!  Check your email. #{random_password}"
      redirect_to "/login"
    else
      @messages << "Invalid Username"
      render "password"
    end
  end
  
  def username  
  end
  
  def retrieve
    @messages = []
    if @user = Patron.find_by_email(params[:email])
      # currently set to private email; NEEDS TO BE ROUTED TO DEDICATED PROJECT EMAIL!!!!!!!!!
      Pony.mail(:to => "#{@user.email}", :from => "malevolentdragon@gmail.com", :subject => "TESTING username", :body => "If you're reading this, username email worked. The username is #{@user.username}.")
      flash[:reset] = "Username Sent!  Check your email. #{@user.email}"
      redirect_to "/login"
    else
      @messages << "Invalid Email Address"
      render "username"
    end
  end

end
