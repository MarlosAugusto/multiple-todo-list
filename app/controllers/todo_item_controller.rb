class TodoItemController < ApplicationController
  def index
    @todo_items = TodoItem.all
  end
end
