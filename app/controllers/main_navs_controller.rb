class MainNavsController < ApplicationController
  before_action :set_main_nav, only: [:show, :edit, :update, :destroy]

  # GET /main_navs
  # GET /main_navs.json
  def index
    @main_navs = MainNav.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @main_navs }
    end
  end

  # GET /main_navs/1
  # GET /main_navs/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @main_nav }
    end
  end

  # GET /main_navs/new
  def new
    @main_nav = MainNav.new
  end

  # GET /main_navs/1/edit
  def edit
  end

  # POST /main_navs
  # POST /main_navs.json
  def create
    @main_nav = MainNav.new(main_nav_params)

    respond_to do |format|
      if @main_nav.save
        format.html { redirect_to @main_nav, notice: 'Main nav was successfully created.' }
        format.json { render json: @main_nav, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @main_nav.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main_navs/1
  # PATCH/PUT /main_navs/1.json
  def update
    respond_to do |format|
      if @main_nav.update(main_nav_params)
        format.html { redirect_to @main_nav, notice: 'Main nav was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @main_nav.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main_navs/1
  # DELETE /main_navs/1.json
  def destroy
    @main_nav.destroy
    respond_to do |format|
      format.html { redirect_to main_navs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_nav
      @main_nav = MainNav.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def main_nav_params
      params.require(:main_nav).permit(:title, :url)
    end
end
