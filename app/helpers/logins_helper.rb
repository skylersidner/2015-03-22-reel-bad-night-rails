module LoginsHelper

  def no_user
    session[:user] = nil
    @user = nil
  end

  def check_for_admin
    @user = Patron.find_by_id(session[:user])
    if @user == nil || @user.username != "Admin"
      flash[:denied] = "You must be logged in as an Administrator to do that."
      redirect_to "/login"
    end
  end

end
