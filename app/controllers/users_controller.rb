class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    binding.pry
    @user.update(user_params)
  end

  private

  def user_params

  end
end
