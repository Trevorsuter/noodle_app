class DropPeoples < ActiveRecord::Migration[5.2]
  def change
    drop_table :peoples
  end
end
