class CreatePostCommitActions < ActiveRecord::Migration
  def change
    create_table :post_commit_actions do |t|
      t.string :type
      t.string :description
      t.string :url
      t.string :repository_id
      t.timestamps
    end
  end
end
