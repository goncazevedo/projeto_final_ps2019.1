class GoalBoardsController < ApplicationController
  load_and_authorize_resource
  before_action :set_goal_board, only: [:show, :edit, :update, :destroy]

  # GET /goal_boards
  # GET /goal_boards.json
  def index
    @goal_boards = GoalBoard.all
  end

  # GET /goal_boards/1
  # GET /goal_boards/1.json
  def show
    @goal_board = GoalBoard.find(params[:id])
    @tasks = TaskBoard.where(goal_board_id: @goal_board.id, finished: false)
    @tasks_finisheds = TaskBoard.where(goal_board_id: @goal_board.id, finished: true)
  end

  # GET /goal_boards/new
  def new
    @goal_board = GoalBoard.new
  end

  # GET /goal_boards/1/edit
  def edit
    @board = Board.find(params[:board])  #Utilizado para editar a partir da página da Diretoria
  end

  # POST /goal_boards
  # POST /goal_boards.json
  def create
    @goal_board = GoalBoard.new(goal_board_params)

    respond_to do |format|
      if @goal_board.save
        format.html { redirect_to @goal_board, notice: 'Goal board was successfully created.' }
        format.json { render :show, status: :created, location: @goal_board }
      else
        format.html { render :new }
        format.json { render json: @goal_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goal_boards/1
  # PATCH/PUT /goal_boards/1.json
  def update
    respond_to do |format|
      if @goal_board.update(goal_board_params)
        format.html { redirect_to @goal_board, notice: 'Goal board was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_board }
      else
        format.html { render :edit }
        format.json { render json: @goal_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_boards/1
  # DELETE /goal_boards/1.json
  def destroy
    @goal_board.destroy
    respond_to do |format|
      format.html { redirect_to goal_boards_url, notice: 'Goal board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_board
      @goal_board = GoalBoard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_board_params
      params.require(:goal_board).permit(:name, :deadline, :finished, :board_id)
    end
end
