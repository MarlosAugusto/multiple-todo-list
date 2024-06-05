class CreateTodoItems < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_items do |t|
      t.text :description
      t.datetime :deadline
      t.text :abandonment_reason

      t.timestamps
    end
  end
end
