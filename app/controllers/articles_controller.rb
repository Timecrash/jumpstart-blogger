class ArticlesController < ApplicationController
  include ArticlesHelper
  before_filter :require_login, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @articles = Article.find(params[:id])

    @comment = Comment.new
    @comment.article_id = @articles.id
  end

  def new
    @articles = Article.new
  end

  def edit
    @articles = Article.find(params[:id])
  end

  def create
    @articles = Article.create(article_params)

    flash.notice = "Article '#{@articles.title}' created!"

    redirect_to article_path(@articles)
  end

  def update
    @articles = Article.find(params[:id])
    @articles.update(article_params)

    flash.notice = "Article '#{@articles.title}' updated!"

    redirect_to article_path(@articles)
  end

  def destroy
    @articles = Article.find(params[:id]).destroy

    flash.notice = "Article '#{@articles.title}' deleted!"

    redirect_to articles_path
  end

end
