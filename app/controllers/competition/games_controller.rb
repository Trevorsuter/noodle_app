class Competition::GamesController < ApplicationController
  before_action :find_competition
  def new
    @game = @competition.games.new
  end

  private
  def find_competition
    @competition = Competition.find(params[:competition_id])
  end
end