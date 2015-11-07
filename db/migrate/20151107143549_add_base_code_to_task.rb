class AddBaseCodeToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :base_code, :text
  end
end
