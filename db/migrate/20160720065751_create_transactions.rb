class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :user_name
      t.string :user_email
      t.integer :user_phone
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
