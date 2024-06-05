class AddTypeToTodoItem < ActiveRecord::Migration[7.1]
  def change
    add_column :todo_items, :type, :integer, default: 0
  end
end
