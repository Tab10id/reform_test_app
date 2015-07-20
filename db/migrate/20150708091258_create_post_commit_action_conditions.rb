class CreatePostCommitActionConditions < ActiveRecord::Migration
  def change
    create_table :post_commit_action_conditions do |t|
      t.string :type
      t.integer :condition_group_id
      t.string :value
      t.boolean :invert, default: false
      t.timestamps
    end

    add_index :post_commit_action_conditions, :condition_group_id
  end
end
