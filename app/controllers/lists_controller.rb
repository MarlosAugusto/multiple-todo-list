class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]

  def list_colors
    @list_colors = ["neutral", "green", "emerald", "red", "yellow", "orange", "blue", "sky"]
  end

  # GET /lists or /lists.json
  def index
    @lists = List.rank(:row_order)
  end

  def sort
    @list = List.find(params[:id])
    @list.update(row_order_position: params[:row_order_position])
    head :no_content
  end

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
    list_colors
  end

  # GET /lists/1/edit
  def edit
    list_colors
  end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to root_path, notice: "List was successfully created." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        if @list.default_list?
          List.where.not(id: @list.id).update_all(default_list: false)
        end
        format.html { redirect_to root_path, notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    respond_to do |format|
      if @list.default_list
        format.html { redirect_to root_path, notice: "You cannot delete the default list." }
        format.json { render json: {error: "You cannot delete the default list."}, status: :unprocessable_entity }
      else
        if @list.todos.count > 0
          current_default_list = List.find_by(default_list: true)
          @list.todos.each do |todo|
            todo.update(list_id: current_default_list.id)
          end
        end
        @list.destroy
        format.html { redirect_to root_path, notice: "List was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name, :color, :default_list)
    end
end
