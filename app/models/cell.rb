class Cell < ApplicationRecord
    has_many :goals
    has_many :users
end
