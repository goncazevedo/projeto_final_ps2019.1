class TaskBoardsController < ApplicationController
  load_and_authorize_resource
  before_action :set_task_board, only: [:show, :edit, :update, :destroy]

  # GET /task_boards
  # GET /task_boards.json
  def index
    @task_boards = TaskBoard.all
  end

  # GET /task_boards/1
  # GET /task_boards/1.json
  def show
  end

  # GET /task_boards/new
  def new
    @task_board = TaskBoard.new
  end

  # GET /task_boards/1/edit
  def edit
    @goal_board = GoalBoard.find(params[:goal_board])
  end

  # POST /task_boards
  # POST /task_boards.json
  def create
    @task_board = TaskBoard.new(task_board_params)

    respond_to do |format|
      if @task_board.save
        goal_finished #Função para fazer com que a meta seja finalizada automaticamente quando todas as tarefas foram finalizadas
        format.html { redirect_to @task_board, notice: 'Task board was successfully created.' }
        format.json { render :show, status: :created, location: @task_board }
      else
        format.html { render :new }
        format.json { render json: @task_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_boards/1
  # PATCH/PUT /task_boards/1.json
  def update
    respond_to do |format|
      if @task_board.update(task_board_params)
        goal_finished #Função para fazer com que a meta seja finalizada automaticamente quando todas as tarefas foram finalizadas
        format.html { redirect_to @task_board, notice: 'Task board was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_board }
      else
        format.html { render :edit }
        format.json { render json: @task_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_boards/1
  # DELETE /task_boards/1.json
  def destroy
    @task_board.destroy
    respond_to do |format|
      format.html { redirect_to task_boards_url, notice: 'Task board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_board
      @task_board = TaskBoard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_board_params
      params.require(:task_board).permit(:name, :description, :finished, :goal_board_id)
    end

    def goal_finished #Função para fazer com que a meta seja finalizada automaticamente quando todas as tarefas foram finalizadas
      @tasks_finisheds = true
      @task_board.goal_board.task_boards.each do |task|
        if task.finished == false
          @tasks_finisheds = false
        end
      end
      if @tasks_finisheds == true
        @task_board.goal_board.update(name: @task_board.goal_board.name, deadline: @task_board.goal_board.deadline, finished: true, board_id: @task_board.goal_board.board_id)
      else
        @task_board.goal_board.update(name: @task_board.goal_board.name, deadline: @task_board.goal_board.deadline, finished: false, board_id: @task_board.goal_board.board_id)
      end
    end

end
