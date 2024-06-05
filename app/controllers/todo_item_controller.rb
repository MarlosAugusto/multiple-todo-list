class TodoItemController < ApplicationController
  before_action :set_todo_item, except: [:index] #only: [:show, :edit, :update, :destroy]

  def index
    @todo_items = TodoItem.sorted
  
    @types = ["personal", "professional"]
    @situations = ["incomplete", "complete", "abandoned", "expired"]
  end

  def edit
  end

  def update
    if @todo_item.update(todo_item_params)
      redirect_to todo_item_path(@todo_item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def todo_item_params
    params.require(:todo_item).permit(:title, :status, :description, :deadline, :abandonment_reason)
  end

  def set_todo_item
    @todo_item = TodoItem.find(params[:id])
  end
end
