class AddRoundToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :round, :integer
  end
end
