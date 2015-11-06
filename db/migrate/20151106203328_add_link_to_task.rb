class AddLinkToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :link, :string
  end
end
