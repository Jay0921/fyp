class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_back fallback_location: '/', notice: 'Comment was successfully created.'
    else
      redirect_back fallback_location: '/'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:sender_id, :recipient_id, :message)
  end
end
