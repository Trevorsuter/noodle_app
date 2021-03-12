class CreatePeoples < ActiveRecord::Migration[5.2]
  def change
    create_table :peoples do |t|
      t.string :name
      t.integer :age
      t.date :birthday
      t.string :email
    end
  end
end
