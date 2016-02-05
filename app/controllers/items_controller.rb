class ItemsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]
   layout "dashboard"
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    respond_to do |format|
        format.html
        format.csv { send_data @items.to_csv }
        format.xls
        format.json
      end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end
  # GET /items/new
  def new
    @item = Item.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /items/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

 # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to '/items', notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to '/items', notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to '/items', notice: 'Item was successfully updated.'  }
      format.json { head :no_content }
    end
  end

  #Import Action To Import CSV or XLS
  def import
    Item.import( params[:file])
    redirect_to '/items', notice: 'Items Imported.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
    params.require(:item).permit(:titlegr, :titleen, :price, :category_id, :user_id, :catalog_id, :items_attributes => [:id, :titlegr, :titleen, :price])
    end
end
