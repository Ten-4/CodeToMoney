class CreateRoundPlayers < ActiveRecord::Migration
  def change
    create_table :round_players do |t|
      t.integer :round_id
      t.integer :user_id
      t.integer :bet
      t.integer :submission_id

      t.timestamps null: false
    end
  end
end
