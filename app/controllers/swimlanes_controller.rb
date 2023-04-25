# frozen_string_literal: true

class SwimlanesController < ApplicationController
  before_action :set_board, only: [:create]

  def new
    @swimlane = Swimlane.new
  end

  def create
    @swimlane = Swimlane.new(
      name: params[:swimlane][:name],
      board: @board
    )
    @swimlane.save!

    redirect_to board_path(@board)
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end
end
