class CreateJoinTableMpUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_mp_users do |t|
      t.references :recipient, index: true
      t.references :private_message, index: true

      t.timestamps
    end
  end
end
