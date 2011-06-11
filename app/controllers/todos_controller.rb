class TodosController < ApplicationController
  respond_to :json

  def index
    render json: Todo.all
  end

  def show
    render json: Todo.find(params[:id])
  end

  def create
    todo = Todo.create!(filtered_params)
    render json: todo
  end

  def update
    todo = Todo.find params[:id]
    if todo.update_attributes filtered_params
      render json: todo
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
  end
  
  private
    def filtered_params
      params.select{ |k,v| k.to_sym.in?(Todo.allowed_attributes)}
    end
end
