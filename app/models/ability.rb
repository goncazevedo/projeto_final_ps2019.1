class Ability
  include CanCan::Ability

  def initialize(user)

    if user.admin?
      can [:manage], :all
    end
      
    if user.accessor?
      #Permissões de acessor (Herança)
      can [:read, :articles, :forum], [Board, Cell, GoalBoard, GoalCell, Post, Project, User] #read Padrão
      can [:manage], Like #Dar Like
      can [:manage], Dislike #Dar Deslike
      can [:manage], PostTag
      can [:new_article, :new_question, :create], Post #Publicar artigos e perguntas
      if GoalBoard.find_by(board_id: user.board_id)
        can [:edit], [TaskBoard], goal_board_id: GoalBoard.find_by(board_id: user.board_id).id
      end
      can [:manage], Post, user_id: user.id 
      can [:edit, :update], User, id: user.id
      #Final das Permissões de acessor (Herança)
    end

    if user.director?
      #Permissões de Diretor (Herança)
      can [:manage], Post, user_id: user.id 
      can [:manage], [Cell]
      can [:manage], [Board], id: user.board_id
      can [:read], [Board]
      can [:manage], [GoalBoard], board_id: user.board_id
      can [:manage], PostTag
      can [:edit], User, id: user.id
      if GoalBoard.find_by(board_id: user.board_id)
        can [:manage], TaskBoard, goal_board_id: GoalBoard.where(board_id: user.board_id).ids
      end


      #Diretor de Gestão Pessoas
      if user.board_id == Board.find_by(name: "Gestão de Pessoas").id
        can [:manage], User
        can [:manage], Fusion
      end
      if user.board_id == Board.find_by(name: "Projetos").id
        can [:manage], Project
      end
      #Final das Permissões de Diretor (Herança)

      #Permissões de acessor (Herança)
      can [:read, :articles, :forum], [Board, Cell, GoalBoard, GoalCell, Post, Project, User] #read Padrão
      can [:manage], Like #Dar Like
      can [:manage], Dislike #Dar Deslike
      can [:new_article, :new_question, :create], Post #Publicar artigos e perguntas
      if GoalBoard.find_by(board_id: user.board_id)
        can [:edit], [TaskBoard], goal_board_id: GoalBoard.find_by(board_id: user.board_id).id
      end

      can [:edit, :update], User, id: user.id
      #Final das Permissões de acessor (Herança)
    end

    if user.manager?
      #Permissões do Gerente da Célula (Herança)
      can [:manage], Cell
      can [:manage], GoalCell, cell_id: user.cell_id
      if GoalCell.find_by(cell_id: user.cell_id)
        can [:manage], TaskCell, goal_cell_id: GoalCell.where(cell_id: user.cell_id).ids
      end
      
      #Gerente de PMO
      if user.cell_id == Cell.find_by(name: "PMO")
        can [:manage], Project
      end
      #Final das Permissões do Gerente da Célula (Herança)
    end

    if user.member?
      if GoalCell.find_by(cell_id: user.cell_id)
        can [:edit], [TaskCell], goal_cell_id: GoalCell.find_by(cell_id: user.cell_id).id
      end
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
