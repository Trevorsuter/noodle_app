class AddPartnerConfirmationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :partner_confirmed, :boolean, default: false
  end
end
