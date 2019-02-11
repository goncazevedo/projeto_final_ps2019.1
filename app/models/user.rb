class User < ApplicationRecord
  belongs_to :board
  belongs_to :cell
end
