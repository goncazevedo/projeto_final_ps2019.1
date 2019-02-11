class User < ApplicationRecord
  belongs_to :board
  belongs_to :cell

  has_many :posts

  #Relação N pra N
  has_many :project_users
  has_many :projects, through: :project_users

  #Relação N pra N
  has_many :fusions
  has_many :boards, through: :fusions
end
