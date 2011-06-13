class TodosController < ApplicationController
  respond_to :json
  around_filter :rescue_error
  def index
    todos = Todo.scoped
    todos = todos.where('name LIKE ? OR description LIKE?', '%'+params[:q]+'%', '%'+params[:q]+'%') if params[:q]
    render json: todos
  end

  def show
    render json: Todo.find(params[:id])
  end

  def create
    todo = Todo.new(filtered_params)
    if todo.save
      render json: todo
    else
      render json: todo.errors, status: :unprocessable_entity
    end
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
    todo = Todo.find(params[:id])
    todo.destroy
    render json: todo
  end

  private
    def filtered_params
      params.select{ |k,v| k.to_sym.in?(Todo.allowed_attributes)}
    end
    def rescue_error
      begin
        yield
      rescue => exception
        return render json: { error: exception.message }, status: :unprocessable_entity
      end
    end
end
