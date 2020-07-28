class CommentsController < ApplicationController
  def create
    hospital = Hospital.find(params[:hospital_id])
    @comment = hospital.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  end

  private
  def comment_params
  	params.require(:comment).permit(:comment)
  end
end