class AddEmailConfirmedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email_confirmed, :boolean, default: false
    change_column :users, :partner_confirmed, :boolean, default: false
  end
end
