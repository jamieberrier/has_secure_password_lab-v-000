class SessionsController < ApplicationController
  def new
  end
  # look up a user in the database, verify their login credentials,
  # and then store the authenticated user's id in the session.
  def create
    @user = User.find_by(name: params[:user][:name])
    binding.pry
    authenticated = @user.try(:authenticate, params[:user][:password])
    # Users should not be able to log in if they enter an incorrect password. Just redirect them back to the login page.
    flash[:error] = "Invalid Log In Credential(s)"

    return redirect_to login_path unless authenticated

    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session.destroy
    redirect_to login_path
  end
end
