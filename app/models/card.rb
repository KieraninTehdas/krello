class Card < ApplicationRecord
  belongs_to :swimlane

  validates :title, presence: true
end
