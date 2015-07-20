class CreatePostCommitActionConditionGroups < ActiveRecord::Migration
  def change
    create_table :post_commit_action_condition_groups do |t|
      t.integer :action_id
      t.integer :parent_id
      t.string :cond_type
      t.timestamps
    end

    add_index :post_commit_action_condition_groups, :parent_id
    add_index :post_commit_action_condition_groups, :action_id
  end
end
