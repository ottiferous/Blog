class CommentsController < ApplicationController

  http_basic_authenticate_with name: 'andrew', password: '1234567890', only: [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    redirect_to post_path(@post)
  end

  def destroy
    # /posts/:post_id/comments/:id
    # first have to find the specific post_id the comment was a part of
    # then find the comment id we want to call destroy on
    # finally redirect to post_path
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
