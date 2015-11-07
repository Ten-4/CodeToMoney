class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer  "user_id"
      t.integer  "task_id"
      t.datetime "created_at",      null: false
      t.string   "link"
      t.integer  "status"
    end
  end
end
