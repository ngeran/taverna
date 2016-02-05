class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]
   layout "dashboard"
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
    respond_to do |format|
        format.html
        format.csv { send_data @categories.to_csv }
        format.xls
        format.json
      end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /categories/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to '/categories', notice: 'Categories was successfully updated.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to '/categories', notice: 'Categories was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #Import Action To Import CSV or XLS
  def import
    Category.import( params[:file])
    redirect_to '/categories', notice: 'Categories Imported.'
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
         params.require(:category).permit(:name, :items_attributes=> [:id, :titleen, :titlegr, :price], :user_ids => [], :catalog_ids => [])
    end
end
