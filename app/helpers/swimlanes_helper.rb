# frozen_string_literal: true

module SwimlanesHelper
  def last_swimlane_id
    "last_swimlane"
  end

  def new_swimlane_id
    "new_swimlane"
  end

  def swimlane_cards_id(swimlane)
    "swimlane_#{swimlane.id}_cards"
  end

  def new_card_id(swimlane)
    "swimlane_#{swimlane.id}_new_card"
  end
end
