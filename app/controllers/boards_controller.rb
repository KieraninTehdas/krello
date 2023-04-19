# frozen_string_literal: true

class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.create(name: params[:board][:name])

    redirect_to @board
  end

  def show
    @board = Board.find(params[:id])
  end
end
