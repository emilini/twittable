class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:show, :edit, :update]

    def index
      @tweets = Tweet.all
    end

    def show
    end

    def edit
    end

    def update
      respond_to do |format|
        if @tweet.update(tweet_params)
          format.html { redirect_to @tweet, notice: 'Tweet was updated.' }
        else
          format.html { rrender :edit }
        end
        # of if
      end
      # of do
    end
    # of update

    def new
      @tweet = Tweet.new
    end

    def create
      @tweet = Tweet.new(tweet_params)

      respond_to do |format|
        if @tweet.save
          format.html { redirect_to @tweet, notice: 'Tweet was posted!'}
        else
          format.html { render :new }
        end
        # of if
    end
    # of do
  end
  # of create

private

  def set_tweet
          @tweet = Tweet.find(params[:id])
  end


  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end
  # of params
end
# of tweet controller
