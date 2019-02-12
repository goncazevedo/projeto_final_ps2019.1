module UsersHelper
    def board_kind_options
        [["Diretor", :director], ["Acessor", :accessor]]
    end

    def cell_kind_options
        [["Gerente", :manager], ["Membro", :member]]
    end
end
