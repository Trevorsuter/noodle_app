class CreatePartnerRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :partner_requests do |t|
      t.references :partner
      t.references :user
    end
    add_foreign_key :partner_requests, :users, column: :partner_id, primary_key: :id
    add_foreign_key :partner_requests, :users, column: :user_id, primary_key: :id
  end
end
