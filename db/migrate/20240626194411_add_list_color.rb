class AddListColor < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :color, :integer, default: 0
  end
end
