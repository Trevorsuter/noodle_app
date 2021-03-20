class AddScoreTypeToCompetitions < ActiveRecord::Migration[5.2]
  def change
    add_column :competitions, :score_type, :integer, default: 0
  end
end
