class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @question, notice: '投稿に成功しました！' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @comments = Comment.all
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :question_id)
  end  
end