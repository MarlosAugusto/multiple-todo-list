class AddRowOrderToListAndTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :row_order, :integer
    add_column :todos, :row_order, :integer
  end
end
