class CreateTargetBehavior < ActiveRecord::Migration
  def change
    create_table :target_behaviors do |t|
      t.references :user, index: true
      t.string :name, null: false
      t.boolean :positive, null: false, default: false
      t.text :goal
      t.text :notes

      t.timestamps
    end
  end
end
