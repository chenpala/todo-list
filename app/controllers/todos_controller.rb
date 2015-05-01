class TodosController < ApplicationController
  before_action :require_sign_in
  before_action :authorized?, only: [:edit, :update, :destroy]

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
    @todos = current_user.todos
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      flash[:success] = "更新成功！"
      redirect_to home_path
    else
      flash.now[:danger] = "更新失敗！"
      render :edit
    end
  end

  def destroy
    @todo.destroy

    redirect_to home_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :category_id).merge(user: current_user)
  end

  def authorized?
    @todo = Todo.find(params[:id])

    if @todo.user != current_user
      flash[:danger] = "權限不足！"
      redirect_to home_path
    end
  end
end
