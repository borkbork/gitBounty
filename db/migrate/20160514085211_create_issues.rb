class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :user
      t.string :repo
      t.timestamps null: false
    end
  end
end
