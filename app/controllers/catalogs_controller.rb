class CatalogsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_catalog, only: [:show, :edit, :update, :destroy]
   layout "dashboard"
  # GET /catalogs
  # GET /catalogs.json
  def index
    @catalogs = Catalog.all
    @catalog = Catalog.new
    @categories = Category.all
    @category = Category.new
    @items = Item.all
    @item = Item.new
    @users = User.all
    respond_to do |format|
        format.html
        format.csv { send_data @catalogs.to_csv }
        format.xls
        format.json
      end
  end

  # GET /catalogs/1
  # GET /catalogs/1.json
  def show
  end

  # GET /catalogs/new
  def new
    @catalog = Catalog.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /catalogs/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /catalogs
  # POST /catalogs.json
  def create
    @catalog = Catalog.new(catalog_params)

    respond_to do |format|
      if @catalog.save
        format.html { redirect_to '/catalogs', notice: 'Catalog was successfully updated.' }
        format.json { render :show, status: :created, location: @catalog }
      else
        format.html { render :new }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalogs/1
  # PATCH/PUT /catalogs/1.json
  def update
    respond_to do |format|
      if @catalog.update(catalog_params)
        format.html { redirect_to '/catalogs', notice: 'Catalog was successfully updated.' }
        format.json { render :show, status: :ok, location: @catalog }
      else
        format.html { render :edit }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogs/1
  # DELETE /catalogs/1.json
  def destroy
    @catalog.destroy
    respond_to do |format|
      format.html { redirect_to catalogs_url, notice: 'Catalog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog
      @catalog = Catalog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalog_params
      params.require(:catalog).permit(:title, :items,:categories,:titleen, :titlegr,:price,:user_ids => [],:categories_attributes => [:id, :name])
    end
end
