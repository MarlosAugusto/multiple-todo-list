class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :name
      t.text :description
      t.datetime :deadline
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
