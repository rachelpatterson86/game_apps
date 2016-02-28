class GamesController < ApplicationController
  def index
  end

  def create
    word = Game.select_word
    @game = Game.create(answer: word)
    redirect_to @game
  end

#TODO:
  def update
    @game = Game.find(params[:id])
    #game_param = params.require(:game).permit(:guess)
#need to know where :guess comes from so add :game. Without it, :guess is nil.
#cant do @game.update(guess: << params[:guess]) b/c << not a method for this.
# ex to show how the data is passed, thus having to call params this way.
#   game: {
  #   guess: 'x'
  # }
    @game.guess << params[:game][:guess] #game_param
    @game.save
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
