class AdminController < ApplicationController
  def main
  end

  def users
    @users = User.all
  end
end
