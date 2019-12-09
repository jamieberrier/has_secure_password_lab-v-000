class SessionsController < ApplicationController
  def new
  end
  # look up a user in the database, verify their login credentials,
  # and then store the authenticated user's id in the session.
  def create
    binding.pry
    @user = User.find_by(name: params[:user][:name])
    session[:user_id] = @user.id
  end
end
