# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_swimlane

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(
      title: params[:card][:title],
      swimlane: @swimlane
    )

    if @card.save
      respond_to do |format|
        format.html { redirect_to board_path(@swimlane.board) }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_swimlane
    @swimlane = Swimlane.find(params[:swimlane_id])
  end
end
