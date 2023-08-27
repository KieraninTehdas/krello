# frozen_string_literal: true

require "system_helper"

RSpec.describe "Cards", type: :system do
  let!(:swimlane) { create(:swimlane) }
  let(:board) { swimlane.board }

  scenario "creating a new card" do
    visit board_path(board)

    expect(page).to have_content board.name
    expect(page).to have_content swimlane.name

    click_on "Add a card"
    card_title = "Ace of Spades"
    fill_in("Title", with: card_title)
    click_button "Create Card"

    expect(page).to have_content(card_title)
  end
end
