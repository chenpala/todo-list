class CategoriesController < ApplicationController
  before_action :require_sign_in
  before_action :authorized?, only: [:show, :edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "新增成功！"
      redirect_to home_path
    else
      flash[:danger] = "種類不能為空或重複！"
      render :new
    end
  end

  def index
    @categories = current_user.categories
  end

  def show
  end

  def edit
  end

  def destroy
    @category.destroy

    redirect_to home_path
  end

  def update
    if @category.update(category_params)
      flash[:success] = "更新成功！"
      redirect_to home_path
    else
      flash.now[:danger] = "更新失敗！"
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name).merge(user: current_user)
  end

  def authorized?
    @category = Category.find(params[:id])

    if @category.user != current_user
      flash[:danger] = "權限不足！"
      redirect_to home_path
    end
  end
end
