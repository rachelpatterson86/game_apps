class GamesController < ApplicationController
  def index
  end

  def create
    word = Game.select_word
    @game = Game.create(answer: word)
    redirect_to @game
  end

  def update
    #validation: perhaps add temp variables. rails form w/o saving into the db. for validating guess.
    @game = Game.find(params[:id])
    @game.guess << params[:game][:guess] #game_param
    @game.turns -= 1
    @game.save
    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
    answer = @game.answer
    @guesses = @game.guess.dup
    @game.guess.clear
    @partial_word = @game.display_partial_word(answer, @guesses)
  end

  def delete
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to root_path
  end

end
