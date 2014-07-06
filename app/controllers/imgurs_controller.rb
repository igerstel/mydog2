class ImgursController < ApplicationController
  before_action :set_imgur, only: [:show, :edit, :update, :destroy]

  # GET /imgurs
  def index
    @imgurs = Imgur.all
  end

  # GET /imgurs/1
  def show
  end

  # GET /imgurs/new
  def new
    @imgur = Imgur.new
  end

  # GET /imgurs/1/edit
  def edit
  end

  # POST /imgurs
  def create
    @imgur = Imgur.new(imgur_params)

    if @imgur.save
      redirect_to @imgur, notice: 'Imgur was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /imgurs/1
  def update
    if @imgur.update(imgur_params)
      redirect_to @imgur, notice: 'Imgur was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /imgurs/1
  def destroy
    @imgur.destroy
    redirect_to imgurs_url, notice: 'Imgur was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imgur
      @imgur = Imgur.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def imgur_params
      params.require(:imgur).permit(:filename, :url, :processed)
    end
end
