class SessionsController < ApplicationController
  def new
  end
  # look up a user in the database, verify their login credentials,
  # and then store the authenticated user's id in the session.
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate
      session[:user_id] = @user.id
    else
    end
  end
end
