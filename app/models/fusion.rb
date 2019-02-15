class Fusion < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates :user_id, presence: true, uniqueness: {:scope => :board_id}
  validates :board_id, presence: true
  validate :already_fusion



  private

  def already_fusion #Validação para saber se o usuário já está em fusão
    if Fusion.find_by(user_id: user.id)
      errors.add(:already_fusion, "The User is already in Fusion")
    end
  end
end
