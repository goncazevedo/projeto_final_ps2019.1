class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  belongs_to :board
  belongs_to :cell

  #Relação N pra N
  has_many :historic_boards
  has_many :boards, through: :historic_boards

  #Relação N pra N
  has_many :historic_cells
  has_many :cells, through: :historic_cells

  acts_as_commontator

  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  
  has_many :posts

  #Relação N pra N
  has_many :project_users
  has_many :projects, through: :project_users

  #Relação N pra N
  has_many :fusions
  has_many :boards, through: :fusions

  validates :name, :age, :board_id, :board_kind,  presence: true
  validates :cell_id, :cell_kind, presence: true, if: :projects_board?

  enum board_kind: {
    director: 0,
    accessor: 1
  }

  enum cell_kind: {
    manager: 0,
    member: 1
  }

  private
    def projects_board? #TODO
      Board.find_by(name: "projetos")
    end
    
end
