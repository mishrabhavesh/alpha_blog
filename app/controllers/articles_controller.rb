class ArticlesController < ApplicationController
before_action :set_article , only: [:edit, :update, :show, :destroy]
before_action :require_user, except: [:index, :show]
before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @article = Article.page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
     @article.user = current_user 
    if @article.save
      flash[:success] = "Article was seccessfully created"
      redirect_to article_path(@article)
    else
      render :new
    
    end
  end

  def edit
  end

  def show
    @article =Article.find(params[:id])
  end

  def update
 
    if @article.update(article_params)
      flash[:success] = "Article was seccessfully updated "
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def destroy
    
    @article.destroy
    flash[:danger]= "Deleted successfully"
    redirect_to articles_path
  end
 
  def set_article
    @article = Article.find(params[:id])
  end

  def require_same_user
    if current_user != @article.user
      flash[:danger]="You can only edit your own article"
      redirect_to root_path
    end
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end