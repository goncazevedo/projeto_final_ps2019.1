class FusionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_fusion, only: [:show, :edit, :update, :destroy]

  # GET /fusions
  # GET /fusions.json
  def index
    @fusion = Fusion.new
    @fusions = Fusion.all
  end

  # GET /fusions/1
  # GET /fusions/1.json
  def show
  end

  # GET /fusions/new
  def new
    @fusion = Fusion.new
  end

  # GET /fusions/1/edit
  def edit
  end

  # POST /fusions
  # POST /fusions.json
  def create
    @fusion = Fusion.new(fusion_params)

    respond_to do |format|
      if @fusion.save
        format.html { redirect_to fusions_path, notice: 'Fusion was successfully created.' }
        format.json { render :show, status: :created, location: @fusion }
      else
        format.html { redirect_to fusions_path, notice: 'Fusion was unsuccessfully created.' }
        format.json { render json: @fusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fusions/1
  # PATCH/PUT /fusions/1.json
  def update
    respond_to do |format|
      if @fusion.update(fusion_params)
        format.html { redirect_to @fusion, notice: 'Fusion was successfully updated.' }
        format.json { render :show, status: :ok, location: @fusion }
      else
        format.html { render :edit }
        format.json { render json: @fusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fusions/1
  # DELETE /fusions/1.json
  def destroy
    @fusion.destroy
    respond_to do |format|
      format.html { redirect_to fusions_url, notice: 'Fusion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fusion
      @fusion = Fusion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fusion_params
      params.require(:fusion).permit(:user_id, :board_id)
    end
end
