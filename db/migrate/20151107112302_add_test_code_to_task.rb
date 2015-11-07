class AddTestCodeToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :test_code, :text
  end
end
