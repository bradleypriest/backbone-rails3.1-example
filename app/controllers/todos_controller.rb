class TodosController < ApplicationController
  respond_to :json
  
  def index
    @todos = Todo.all
    respond_with @todos
  end

  def show
    @todo = Todo.find(params[:id])
    respond_with @todo
  end

  def create
    @todo = Todo.new(filtered_params)
    if @todo.save
      respond_with @todo
    else
      respond_with @todo.errors
    end
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update_attributes(filtered_params)
      respond_with @todo
    else
      respond_with @todo.errors

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
