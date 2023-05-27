# frozen_string_literal: true

module CardsHelper
  def new_card_id(swimlane)
    "swimlane_#{swimlane.id}_new_card"
  end

  def last_card_id(swimlane)
    "swimlane_#{swimlane.id}_last_card"
  end
end
