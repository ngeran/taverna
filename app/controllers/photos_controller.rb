class PhotosController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @photo = Photo.new

  end

  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    @photo.uploaded_by = current_user.id if current_user
    # if @gallery.save
    #   render json: { message: "success" }, :status => 200
    # else
    #   #  you need to send an error header, otherwise Dropzone
    #   #  will not interpret the response as an error:
    #   render json: { error: @gallery.errors.full_messages.join(',')}, :status => 400
    # end
    respond_to do |format|
      if @photo.save
        format.html { redirect_to '/photos', notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to '/photos', notice: 'Photowas successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:album_id, :image, :title, :description, :content_type, :file_size, :uploaded_by, :image_cache)
    end
end
