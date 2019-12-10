class SessionsController < ApplicationController
  def new
  end
  # look up a user in the database, verify their login credentials,
  # and then store the authenticated user's id in the session.
  def create
    @user = User.find_by(name: params[:user][:name])
    # return head(:forbidden) unless @user.authenticate(params[:user][:password])
    # @user.try(:authenticate, params[:user][:password])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.destroy
    redirect_to login_path
  end
end
