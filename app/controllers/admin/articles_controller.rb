class Admin::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      # flash it. necessary?
      redirect_to article_url(@article)
    else
      # set flash here
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to article_url(@article)
    else
      render :edit
    end
  end
end
