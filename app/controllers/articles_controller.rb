class ArticlesController < ApplicationController
  def index
  end

  def new 
  	  @article = Article.new
  end
  def create
@article = Article.new(article_params) 
if @article.save
# flash is a hash with key success it should be viewed so we write a view in appliction.erb view body
flash[:success] = "Article has been created" 
redirect_to articles_path
else
	flash[:danger] = "Article has not been created"
render :new
end
end

# article_params is passed to new as it list info of article that is taken from the web while permiting title and body only
private
def article_params
params.require(:article).permit(:title, :body) 
end
end
