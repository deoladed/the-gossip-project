class CreateJointTablePotinTags < ActiveRecord::Migration[5.2]
  def change
    create_table :joint_table_potin_tags do |t|
      t.belongs_to :potin, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
