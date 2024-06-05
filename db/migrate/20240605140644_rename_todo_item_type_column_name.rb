class RenameTodoItemTypeColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :todo_items, :type, :todo_item_type
  end
end
