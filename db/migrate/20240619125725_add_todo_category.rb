class AddTodoCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :category, :integer, default: 0
  end
end
