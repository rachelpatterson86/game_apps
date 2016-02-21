class GamesController < ApplicationController
  def index
  end

  # def new
  #   @game = Game.new
  # end

  def create
    @game = Game.new
    @game.save
    redirect_to @game
  end

  # def edit
  #   @game = Game.find(params[:id])
  # end

  def update
    @game = Game.find(params[:id])
    game_param = params.require(:game).permit(:guess) 
    @game.update(game_param)
    redirect_to @game
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
