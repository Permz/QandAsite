class CategoryController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]
  before_action :isnt_manager, only: [:new, :update, :destroy]

  def new
    @category = Category.new
  end

  def index
    @category = Category.all
  end

  def create
    @category = category.new(category_params)
  end


  def update
    
  end

  def show
    
  end

  def delete
    
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def isnt_manager
    current_user.admin_flg == false
  end

end
