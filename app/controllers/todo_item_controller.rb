class TodoItemController < ApplicationController
  before_action :set_todo_item, except: [:index] #only: [:show, :edit, :update, :destroy]

  def index
    @todo_items = TodoItem.sorted
  
    @types = ["personal", "professional"]
    @situations = ["incomplete", "complete", "abandoned", "expired"]
  end

  def edit
    @types = ["personal", "professional"]
  end

  def update
    if @todo_item.update(todo_item_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # def filter_by_status
  #   @todo_items = TodoItem.all.where(geographic_filter: params[:geo_filter])
  #                         .includes(:specialties, :addresses, :phone_numbers, :cabinets).shuffle

  #   render partial: 'midwives/midwives_cards', locals: { midwives: midwives }
  # end

  def todo_item_params
    params.require(:todo_item).permit(:title, :status, :description, :deadline, :abandonment_reason, :todo_item_type)
  end

  def set_todo_item
    @todo_item = TodoItem.find(params[:id])
  end
end
