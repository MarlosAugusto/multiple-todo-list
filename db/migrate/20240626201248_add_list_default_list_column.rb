class AddListDefaultListColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :default_list, :boolean
  end
end
