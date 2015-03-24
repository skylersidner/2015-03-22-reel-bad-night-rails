module LoginsHelper

  def no_user
    session[:user] = nil
    @user = nil
  end

  def check_for_admin
    @user = Patron.find_by_id(session[:user])
    if @user.username != "Admin"
      redirect "/login"
    end
  end

end
