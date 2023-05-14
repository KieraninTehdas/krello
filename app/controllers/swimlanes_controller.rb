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

    if @swimlane.save

      respond_to do |format|
        format.html { redirect_to board_path(@board) }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end
end
