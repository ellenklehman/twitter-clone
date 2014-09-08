class TweetsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @tweets = @user.tweets.all
  end

  def new
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.new
  end

  def create
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to user_tweets_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:content, :user_id)
  end
end