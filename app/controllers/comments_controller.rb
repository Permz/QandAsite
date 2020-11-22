class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    question = Question.find(params[:question_id])
    @comment = question.comments.build(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to question, notice: '投稿に成功しました！' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { redirect_to question, alert: '投稿に失敗しました' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    question_comment = @question.comments.find(params[:id])
    redirect_to request.referer if question_comment.user != current_user
    question_comment.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'コメント削除に成功しました' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_url unless @comment
  end
end
