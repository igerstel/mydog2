class RedditsController < ApplicationController
  before_action :set_reddit, only: [:show, :edit, :update, :destroy]

  # GET /reddits
  def index
    @reddits = Reddit.all
  end

  # GET /reddits/1
  def show
  end

  # GET /reddits/new
  def new
    @reddit = Reddit.new
  end

  # GET /reddits/1/edit
  def edit
  end

  # POST /reddits
  def create
    @reddit = Reddit.new(reddit_params)

    if @reddit.save
      redirect_to @reddit, notice: 'Reddit was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reddits/1
  def update
    if @reddit.update(reddit_params)
      redirect_to @reddit, notice: 'Reddit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reddits/1
  def destroy
    @reddit.destroy
    redirect_to reddits_url, notice: 'Reddit was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reddit
      @reddit = Reddit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reddit_params
      params.require(:reddit).permit(:name, :url, :imgur_id)
    end
end
