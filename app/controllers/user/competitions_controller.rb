class User::CompetitionsController < ApplicationController
  before_action :find_competitions, only: [:index]
  before_action :find_competition, only: [:show]
  before_action :find_competition_games, only: [:show]

  def index
  end

  def show
  end

  private
  def find_competitions
    @competitions = current_user.competitions
  end

  private
  def find_competition
    @competition = Competition.find(params[:id])
  end

  def find_competition_games
    @games = @competition.games
  end
end