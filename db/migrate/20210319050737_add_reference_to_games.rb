class AddReferenceToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :competition, foreign_key: true
  end
end
