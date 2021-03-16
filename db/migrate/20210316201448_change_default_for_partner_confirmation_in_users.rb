class ChangeDefaultForPartnerConfirmationInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :partner_confirmed, :boolean, default: nil
  end
end
