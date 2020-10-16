class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    question = Question.find(params[:question_id])
    @comment = question.comments.build(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to question, notice: '投稿に成功しました！' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to question, notice: 'コメント削除に成功しました' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end  
end