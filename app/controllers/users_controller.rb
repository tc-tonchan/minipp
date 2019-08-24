class UsersController < ApplicationController
  def index
    @user = User.new
    user = User.find(params[:id])
  end
  
  def show
    @nickname = crrent_user.nickname
    @tweets = current_user.tweets
  end
end
