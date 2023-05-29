# frozen_string_literal: true

require 'system_helper'

RSpec.describe "Boards", type: :system do
  scenario "creating a new board" do
    board_name = "My Board"

    visit root_path

    click_button("New board")
    fill_in("Name", with: board_name)
    click_button("Create Board")
    expect(page).to have_content(board_name)
  end
end
