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

    @card.save!
  end

  private

  def set_swimlane
    @swimlane = Swimlane.find(params[:swimlane_id])
  end
end
