class AlbumsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  layout 'dashboard'
  def index
    @albums = Album.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def new
    @album = Album.new

  end

  def edit

  end
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to '/albums', notice: 'Album was successfully created.' }
        format.json { render action: 'show', status: :created, location: @album }
      else
        format.html { render action: 'new' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end
  # def create
  #   @album = current_user.albums.build(album_params)
  #   authorize User
  #   if @album.save
  #     # to handle multiple images upload on create
  #     if params[:images]
  #       params[:images].each { |image|
  #         @album.photos.create(image: image)
  #       }
  #     end
  #     flash[:notice] = "Your album has been created."
  #     redirect_to @album
  #   else
  #     flash[:alert] = "Something went wrong."
  #     render :new
  #   end
  # end
  def update
    #
    # if @album.update(params[:album].permit(:title,:description))
    #   # to handle multiple images upload on update when user add more picture
    #   if params[:images]
    #     params[:images].each { |image|
    #       @album.photos.create(image: image)
    #     }
    #   end
    #   flash[:notice] = "Album has been updated."
    #   redirect_to @album
    # else
    #   render :edit
    # end
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to '/albums', notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    respond_with(@album)

  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:title, :description, :user_id, :created_at, :updated_at)
    end
end
