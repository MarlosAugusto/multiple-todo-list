class ChangeDescriptionToRichText < ActiveRecord::Migration[7.1]
  include ActionView::Helpers::TextHelper
  def change
    rename_column :todo_items, :description, :description_old
    TodoItem.all.each do |item|
      item.update_attribute(:description, simple_format(item.description_old))
    end
    remove_column :todo_items, :description_old
  end
end
