class DropConfirmationColumnsInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :partner_confirmed, :boolean
    remove_column :users, :email_confirmed, :boolean
  end
end
