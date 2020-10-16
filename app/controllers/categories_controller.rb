class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]
  before_action :isnt_manager, only: [:new, :update, :destroy]

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'カテゴリー追加に成功しました！' }
        format.json { render :index, status: :created, location: @category }
      else
        format.html { render :new, alert: 'カテゴリー追加に失敗しました' }
      end
    end
  end

  def show
    @category = Category.find(params[:id])
    @questions = @category.questions
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
