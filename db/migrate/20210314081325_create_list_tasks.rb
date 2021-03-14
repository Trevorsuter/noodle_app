class CreateListTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :list_tasks do |t|
      t.references :list, foreign_key: true
      t.references :task, foreign_key: true
    end
  end
end
