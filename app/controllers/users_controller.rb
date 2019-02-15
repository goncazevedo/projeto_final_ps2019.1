class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_old_board, only: [:update]
  before_action :set_old_cell, only: [:update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @projects = @user.projects.where(finished: false) #Todos os projetos em andamento, no qual o usuario faz parte, para mostrar no show
    @projects_finisheds = @user.projects.where(finished: true) #Todos os projetos Finalizados, no qual o usuario é membro, para mostrar no show

    @articles = @user.posts.where(kind: "article") #Todos os artigos criados pelo usuario para aparecer no show
    @questions = @user.posts.where(kind: "question") #Todas as perguntas do usuário para aparecer no show
    
    @historic_boards = HistoricBoard.where(user_id: @user.id) #Histórico de Diretorias para aparecer no show do user
    @historic_cells = HistoricCell.where(user_id: @user.id) #Histórido de células para aparecer no show do user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|

      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }

        if @old_board != @user.board_id
          historic = HistoricBoard.create(user_id: @user.id, board_id: @old_board, departure: Time.now, entry: entry_time_board)
          historic.save
        end

        if @old_cell != @user.cell_id
          historic = HistoricCell.create(user_id: @user.id, cell_id: @old_cell, departure: Time.now, entry: entry_time_cell)
          historic.save
        end

      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:board_id, :cell_id, :name, :email, :password, :password_confirmation, :age, :cell_kind, :board_kind, :photo, :creation_cell)
    end

    def set_old_board
      @old_board = @user.board_id
    end

    def set_old_cell
      @old_cell = @user.cell_id
    end

    def entry_time_board
      if @user.historic_boards == []
        return created_at
      else
        return @user.historic_boards.last.departure
      end
    end
    
    def entry_time_cell
      if @user.historic_cells == []
        return created_at
      else
        return @user.historic_cells.last.departure
      end
    end

end
