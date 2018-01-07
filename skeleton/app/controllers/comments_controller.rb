class CommentsController < ApplicationController
  before_action :require_logged_in

  def create

    @comment = Comment.new(comment_params)
    @comment.link = Link.find(params[:link_id])
    @comment.user = @comment.link.user
    if @comment.save
      redirect_to link_url(@comment.link)
    else
      flash[:errors] = 'invalid params'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    temp_link_id = @comment.link.id
    @comment.destroy
    redirect_to link_url(temp_link_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user)
  end
end
