class GoalCellsController < ApplicationController
  before_action :set_goal_cell, only: [:show, :edit, :update, :destroy]

  # GET /goal_cells
  # GET /goal_cells.json
  def index
    @goal_cells = GoalCell.all
  end

  # GET /goal_cells/1
  # GET /goal_cells/1.json
  def show
  end

  # GET /goal_cells/new
  def new
    @goal_cell = GoalCell.new
  end

  # GET /goal_cells/1/edit
  def edit
  end

  # POST /goal_cells
  # POST /goal_cells.json
  def create
    @goal_cell = GoalCell.new(goal_cell_params)

    respond_to do |format|
      if @goal_cell.save
        format.html { redirect_to @goal_cell, notice: 'Goal cell was successfully created.' }
        format.json { render :show, status: :created, location: @goal_cell }
      else
        format.html { render :new }
        format.json { render json: @goal_cell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goal_cells/1
  # PATCH/PUT /goal_cells/1.json
  def update
    respond_to do |format|
      if @goal_cell.update(goal_cell_params)
        format.html { redirect_to @goal_cell, notice: 'Goal cell was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_cell }
      else
        format.html { render :edit }
        format.json { render json: @goal_cell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_cells/1
  # DELETE /goal_cells/1.json
  def destroy
    @goal_cell.destroy
    respond_to do |format|
      format.html { redirect_to goal_cells_url, notice: 'Goal cell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_cell
      @goal_cell = GoalCell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_cell_params
      params.require(:goal_cell).permit(:name, :deadline, :finished, :cell_id)
    end
end
