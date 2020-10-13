class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :new]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.paginate(page: params[:page], per_page: 6)
    @category_list = Category.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question_categories = @question.categories
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.new(question_params)
    category_list = params[:question][:category_id].split(nil)
    @question.user_id = current_user.id
    @question.title = params[:question][:title]
    @question.content = params[:question][:content]
    @question.save

    respond_to do |format|
      if @question.save
        @question.save_category(category_list)
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
      params.require(:question).permit(:title, :content, :user_id)
    end
end