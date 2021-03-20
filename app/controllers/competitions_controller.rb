class CompetitionsController < ApplicationController
  def new
    @competition = Competition.new
  end

  def create
    params
    @competition = Competition.new(competition_params)
    if @competition.save
      flash[:notice] = "Competition Created! Create a game to get started."
      redirect_to new_competition_game_path(@competition)
    else
      flash[:notice] = "You must've forgot some information. Try again."
      render :new
    end
  end

  private
  def competition_params
    params.require(:competition).permit(:name, :point_limit, :score_type)
  end
end