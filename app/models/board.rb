class Board < ApplicationRecord
  has_many :swimlanes

  validates :name, presence: true
end
