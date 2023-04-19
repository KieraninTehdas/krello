class Swimlane < ApplicationRecord
  has_many :cards

  belongs_to :board

  validates :name, presence: true
end
