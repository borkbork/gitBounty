class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :name
      t.integer :lv_req

      t.timestamps null: false
    end
  end
end
