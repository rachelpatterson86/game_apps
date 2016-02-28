class GamesController < ApplicationController
  def index
  end

  def create
    word = Game.select_word
    @game = Game.create(answer: word)
    redirect_to @game
  end

#TODO: game_param how work..., why need to add :game?
  def update
    @game = Game.find(params[:id])
    #game_param = params.require(:game).permit(:guess)
#need to know where :guess comes from so add :game. Without it, :guess is nil.
#cant do @game.update(guess: << params[:guess]) b/c << not a method for this.
# ex to show how the data is passed, thus having to call params this way.
#   game: {
  #   guess: 'x'
  # }
  #contrast to this ex: http://guides.rubyonrails.org/action_controller_overview.html#parameters
    @game.guess << params[:game][:guess] #game_param
    @game.save
    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
    #prevents for from auto populating previous values of :guess.
  #http://stackoverflow.com/questions/26435154/disable-autopopulate-of-select-fields-with-database-values-in-rails-4-edit-form
  #Can call form data in the controller. Why is this possible. How does Rails know?
    @game.guess.clear
  end

  def delete
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to root_path
  end

end
