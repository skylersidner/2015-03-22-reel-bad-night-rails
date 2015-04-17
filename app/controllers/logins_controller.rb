class LoginsController < ApplicationController
  include LoginsHelper

  def login
  end
  
  def validate
    
    #create array to hold information about problems with the login
    @messages = []
    #check if username exists in database
    if @user = Patron.find_by_username(params[:username])
      #check if password matches that username's password
      if @user.try(:authenticate, params[:password])
        #capture that user's id for the session cookie
        session[:user] = @user.id
        #create success message for new route
        flash[:success] = "Login Successful!"
        #send to new route
        redirect_to "/patrons/#{@user.id}"
      else
        #if password doesn't match, stay on page and show message
        @messages << "Invalid Password"
        render "login"
      end
    else
      #if username isn't in database, stay on page and show message
      @messages << "Invalid Username"
      render "login"
    end
    # As an aside, I realize that this is a minor security vulnerability;
    # I may have the message display, "Invalid Username or Password" in the
    # future, but I have it this way to make the logic path more tangible.

  end
  
  def logout
    #helper that sets session cookie and @user variable  to nil
    no_user
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
      Pony.mail(:to => "#{@user.email}", :from => "noreply.reelbadadmin@gmail.com", :subject => "Your reset password for A Reel Bad Night", :body => "Someone requested a password reset for this account (hopefully you). Your password has been reset to: #{random_password}.")
      flash[:reset] = "Password Reset!  Check your email."
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
      Pony.mail(:to => "#{@user.email}", :from => "noreply.reelbadadmin@gmail.com", :subject => "Your username for A Reel Bad Night", :body => "Someone requested a username retrieval for this account (hopefully you). Your username is #{@user.username}.")
      flash[:reset] = "Username Sent!  Check your email."
      redirect_to "/login"
    else
      @messages << "Invalid Email Address"
      render "username"
    end
  end

end
