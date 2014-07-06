class FbImgsController < ApplicationController
  before_action :set_fb_img, only: [:show, :edit, :update, :destroy]

  # GET /fb_imgs
  def index
    @fb_imgs = FbImg.all
  end

  # GET /fb_imgs/1
  def show
  end

  # GET /fb_imgs/new
  def new
    @fb_img = FbImg.new
  end

  # GET /fb_imgs/1/edit
  def edit
  end

  # POST /fb_imgs
  def create
    @fb_img = FbImg.new(fb_img_params)

    if @fb_img.save
      redirect_to @fb_img, notice: 'Fb img was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /fb_imgs/1
  def update
    if @fb_img.update(fb_img_params)
      redirect_to @fb_img, notice: 'Fb img was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /fb_imgs/1
  def destroy
    @fb_img.destroy
    redirect_to fb_imgs_url, notice: 'Fb img was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fb_img
      @fb_img = FbImg.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fb_img_params
      params.require(:fb_img).permit(:filename, :ext, :imgur_id, :processed)
    end
end
