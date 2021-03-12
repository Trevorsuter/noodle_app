class CreateUsers2 < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :birthday
      t.references :partner
    end
  end
end
