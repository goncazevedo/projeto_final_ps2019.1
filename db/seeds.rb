# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




#Seed do Arthur
Board.create(name: 'Projetos', description: 'Diretoria de Projetos')
Cell.create(name: 'PMO', description: 'Célula de PMO')

Board.create(name: "Financeiro", description: "Diretoria Financeira")
Cell.create(name: " ", description: "Célula Vazia")

User.create(name: "Natalia Coinbra", age: 18, email:"natalia@email.com", password: "123456", board_id: 1, board_kind: 0, cell_id: 1, cell_kind: 0, creation_cell: false)

GoalBoard.create(name: "Terminar Projeto", deadline: "2019-02-12",finished: false, board_id: 1)

GoalCell.create(name: "Layout", deadline: "2019-02-12",finished: false, cell_id: 1)

Post.create(title: "Post Teste", content: "Conteúdo do Post Teste", user_id: 1, kind: 0)  #Nao tem foto ainda

Project.create(title: "Projeto Teste", deadline: "2019-02-12")

Tag.create(name: Rails)

TaskBoard.create(name: "Terminar Scaffolds", description: "Terminar Scaffolds o mais rápido possível", finished: false, goal_board_id: 1)

TaskCell.create(name: "Terminar Layout do Login", description: "Terminar Layout do login o mais rápido possível", finished: false, goal_cell_id: 1)