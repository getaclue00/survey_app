module SessionsHelper
  
  # using built in session helper from Rails
  def sign_in(user)
    session[:user_id] = user.id
  end
  
  # creating an instance variable to store the current user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # checks if the user is signed in (or not)
  def signed_in?
    !current_user.nil?
  end
  
  # delete current_user
  # using built-in rails method session.delete
  # remove pointer to current_user
  def sign_out
    session.delete(:user_id)
    reset_session
    @current_user = nil
  end
end
