class GamesController < ApplicationController
  def index
    @game = Game.all
  end

  def create
    word = Game.select_word
    @game = Game.create(answer: word)
    redirect_to @game
  end

  def update
    @game = Game.find(params[:id])
    guess = (params[:game][:guess]).downcase
    if @game.is_valid?(guess)
      @game.guess << guess
      @game.turn_count(guess)

      @game.save
      @game.game_over
    end
    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
    answer = @game.answer
    @guesses = @game.guess.dup
    @game.guess.clear
    @partial_word = @game.display_partial_word(answer, @guesses)
  end

end
