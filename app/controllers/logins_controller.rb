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
