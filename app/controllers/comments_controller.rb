class CommentsController < ApplicationController

  #http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  before_action :authenticate_user!

  def create
    find_article

    @comment = Comment.new(comment_params.merge(article_id: @article.id))

        if @comment.save
          redirect_to article_path(@article)
        else
          render "articles/show"
        end

    # @comment = @article.comments.create(comment_params)
# binding.irb
#     redirect_to article_path(@article)
  end

  def destroy
    find_article
    # @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
    #@comment = @article.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
