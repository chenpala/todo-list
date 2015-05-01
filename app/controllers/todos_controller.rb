class TodosController < ApplicationController
  before_action :require_sign_in

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      flash[:success] = "新增成功！"
      redirect_to home_path
    else
      flash.now[:danger] = "新增失敗！"
      render :new
    end
  end

  def index
    @todos = Todo.all
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.save
      flash[:success] = "更新成功！"
      redirect_to home_path
    else
      flash.now[:danger] = "更新失敗！"
      render :edit
    end
  end

  def destroy
    @todo = Todo.find(params[:id])

    @todo.destroy

    redirect_to home_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
