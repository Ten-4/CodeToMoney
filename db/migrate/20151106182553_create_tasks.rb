class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :prize
      t.integer :user_id
      t.datetime :deadline
      t.integer :status

      t.timestamps null: false
    end
  end
end
