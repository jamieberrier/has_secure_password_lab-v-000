class WelcomeController < ApplicationController
  before_action :require_logged_in
  def show
    #@user = User.find(session[:user_id])
  end
end
