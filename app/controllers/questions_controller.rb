class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[index show]

  add_breadcrumb '相談一覧', :questions_path

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.paginate(page: params[:page], per_page: 6)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question_categories = @question.categories
    @user = @question.user
    @comment = @question.comments.build
    add_breadcrumb '質問詳細', :question_path
  end

  # GET /questions/new
  def new
    @question = Question.new
    add_breadcrumb '質問作成', :new_question_path
  end

  # GET /questions/1/edit
  def edit
    add_breadcrumb '質問編集', :edit_question_path
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.new(question_params)
    @category_ids = @question.categories.pluck(:id)

    respond_to do |format|
      if @question.save
        @category_ids.each do |category_id|
          category_id.save
        end
        format.html { redirect_to @question, notice: '投稿に成功しました！' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: '保存に成功しました！' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: '削除に成功しました' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:title, :content, :user_id, :best_answer_id, category_ids: [])
  end
end
