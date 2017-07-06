class TweetsController < ApplicationController
  before_action :authenticate_user!

    def index
    end

    def show
      @tweet = Tweet.find(params[:id])
    end

    def edit
    end

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

  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end
  # of params
end
# of tweet controller
