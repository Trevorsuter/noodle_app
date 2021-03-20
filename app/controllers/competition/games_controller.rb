class Competition::GamesController < ApplicationController
  before_action :find_competition
  def new
    @game = @competition.games.new
  end

  def create
    @game = @competition.games.new(game_params)
    if @game.save
      Participant.create!(game: @game, user: current_user)
      flash[:notice] = "Game created. Good luck, soldier!"
      redirect_to user_competition_path(current_user, @competition)
    else
      flash[:notice] = "You forgot some information. Try again."
      render :new
    end
  end

  private
  def find_competition
    @competition = Competition.find(params[:competition_id])
  end

  private
  def game_params
    params.require(:game).permit(:name, :winning_score)
  end
end