class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :code
      t.integer :user_id
      t.boolean :passed
      t.boolean :status

      t.timestamps null: false
    end
  end
end
