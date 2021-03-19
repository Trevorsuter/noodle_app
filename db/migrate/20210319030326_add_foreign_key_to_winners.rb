class AddForeignKeyToWinners < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :competitions, :users, column: :winner_id, primary_key: :id
  end
end
