class CreateCompetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :competitions do |t|
      t.string :name
      t.integer :point_limit
      t.timestamps
    end
  end
end
