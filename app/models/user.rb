class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  

  belongs_to :board
  belongs_to :cell

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
      Board.find_by(id: :board_id) == 0
    end
    
end
