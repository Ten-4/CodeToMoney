class RemoveRoundFromSubmissions < ActiveRecord::Migration
  def change
    remove_column :submissions, :round, :integer
  end
end
