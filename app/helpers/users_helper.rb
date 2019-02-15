module UsersHelper
    def board_kind_options
        [["Diretor", :director], ["Acessor", :accessor]]
    end

    def cell_kind_options
        [["Gerente", :manager], ["Membro", :member]]
    end

    def fusion?
        if Fusion.find_by(user_id: @user.id)
            true
        else
            false
        end
    end

    def board_fusion
        if fusion?
            fusion = Fusion.find_by(user_id: @user.id)
            board_fusion = Board.find_by(id: fusion.board_id)
            return board_fusion
        end
    end
end
