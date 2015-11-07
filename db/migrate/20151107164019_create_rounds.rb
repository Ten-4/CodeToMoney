class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.datetime :start_time
      t.datetime :bet_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
