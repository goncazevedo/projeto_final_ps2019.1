class TaskCellsController < ApplicationController
  before_action :set_task_cell, only: [:show, :edit, :update, :destroy]

  # GET /task_cells
  # GET /task_cells.json
  def index
    @task_cells = TaskCell.all
  end

  # GET /task_cells/1
  # GET /task_cells/1.json
  def show
  end

  # GET /task_cells/new
  def new
    @task_cell = TaskCell.new
  end

  # GET /task_cells/1/edit
  def edit
  end

  # POST /task_cells
  # POST /task_cells.json
  def create
    @task_cell = TaskCell.new(task_cell_params)

    respond_to do |format|
      if @task_cell.save
        format.html { redirect_to @task_cell, notice: 'Task cell was successfully created.' }
        format.json { render :show, status: :created, location: @task_cell }
      else
        format.html { render :new }
        format.json { render json: @task_cell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_cells/1
  # PATCH/PUT /task_cells/1.json
  def update
    respond_to do |format|
      if @task_cell.update(task_cell_params)
        format.html { redirect_to @task_cell, notice: 'Task cell was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_cell }
      else
        format.html { render :edit }
        format.json { render json: @task_cell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_cells/1
  # DELETE /task_cells/1.json
  def destroy
    @task_cell.destroy
    respond_to do |format|
      format.html { redirect_to task_cells_url, notice: 'Task cell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_cell
      @task_cell = TaskCell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_cell_params
      params.require(:task_cell).permit(:name, :description, :finished, :goal_cell_id)
    end
end
