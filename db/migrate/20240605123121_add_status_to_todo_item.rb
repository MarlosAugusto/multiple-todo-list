class AddStatusToTodoItem < ActiveRecord::Migration[7.1]
  def change
    add_column :todo_items, :status, :integer, default: 0
  end
end
