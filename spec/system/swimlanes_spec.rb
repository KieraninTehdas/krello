# frozen_string_literal: true

require "system_helper"

RSpec.describe "Swimlanes", type: :system do
  let!(:board) { create(:board) }

  scenario "creating a new swimlane" do
    visit boards_path(board)

    click_on board.name
    expect(page).to have_content board.name
    click_on "Add another list"

    swimlane_name = "MySwimlane"
    fill_in("Name", with: swimlane_name)
    click_button "Add List"
    expect(page).to have_content swimlane_name

    click_on "Add a card"
    card_title = "Ace of Spades"
    fill_in("Title", with: card_title)
    click_button "Create Card"

    expect(page).to have_content(card_title)
  end
end
