class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @articles = Article.new
  end

  def create
    @article = Article.new(params_article)
    @article.save
    redirect_to article_path(@article)
  end

  def edit
  end

  def update
    @article.update(params_article)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def params_article
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
