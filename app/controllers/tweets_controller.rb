class TweetsController < ApplicationController

  # before_action :move_to_index

  def index
    @tweet = Tweet.new
    @tweets = Tweet.includes(:user)
  end
  
  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      respond_to do |format|
        format.html {redirect_to "/"}
        format.json
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
    redirect_to root_path
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
      redirect_to root_path
    end
  end

  # def show
  #   @tweet = Tweet.find(params[:id])
  # end

  private
  def tweet_params
    params.require(:tweet).permit(:text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to :action => "index" unless user_signed_in?
  end
end
