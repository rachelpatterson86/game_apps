class GamesController < ApplicationController
  def index
  end

  # def new
  #   @game = Game.new
  # end

  def create
    @game = Game.new
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
  end

  def show
    @game = Game.find(params[:id])
  end

  def delete
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to root_path
  end

end
