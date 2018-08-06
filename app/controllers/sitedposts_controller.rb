class SitedpostsController < ApplicationController
  before_action :set_sitedpost, only: [:show, :edit, :update, :destroy]

  # GET /sitedposts
  # GET /sitedposts.json
  def index
    @sitedposts = Sitedpost.all
  end

  # GET /sitedposts/1
  # GET /sitedposts/1.json
  def show
  end

  # GET /sitedposts/new
  def new
    @sitedpost = Sitedpost.new
  end

  # GET /sitedposts/1/edit
  def edit
  end

  # POST /sitedposts
  # POST /sitedposts.json
  def create
    @sitedpost = Sitedpost.new(sitedpost_params)

    respond_to do |format|
      if @sitedpost.save
        format.html { redirect_to @sitedpost, notice: 'Sitedpost was successfully created.' }
        format.json { render :show, status: :created, location: @sitedpost }
      else
        format.html { render :new }
        format.json { render json: @sitedpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sitedposts/1
  # PATCH/PUT /sitedposts/1.json
  def update
    respond_to do |format|
      if @sitedpost.update(sitedpost_params)
        format.html { redirect_to @sitedpost, notice: 'Sitedpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @sitedpost }
      else
        format.html { render :edit }
        format.json { render json: @sitedpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sitedposts/1
  # DELETE /sitedposts/1.json
  def destroy
    @sitedpost.destroy
    respond_to do |format|
      format.html { redirect_to sitedposts_url, notice: 'Sitedpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sitedpost
      @sitedpost = Sitedpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sitedpost_params
      params.require(:sitedpost).permit(:content, :position)
    end
end
