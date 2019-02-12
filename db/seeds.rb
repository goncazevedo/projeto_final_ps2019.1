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

User.create(name: "Natalia Coinbra", age: 18, email:"natalia@email.com", password: "123456", board_id: 1, board_kind: 0, cell_id: 1, cell_kind: 0,)

#Goal.create()

#Post.create()

#Project.create()

#Tag.create()

#Task.create