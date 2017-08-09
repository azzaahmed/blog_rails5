class ArticlesController < ApplicationController
	
# set_article would be used only in show edit update destroy actions
before_action :set_article, only: [:show, :edit, :update, :destroy]
#before_action :authenticate_user!, except: [:index, :show]
  def index
 @articles = Article.all
  end

  def new 
  	  @article = Article.new
  end

  def create
@article = Article.new(article_params)
@article.user = current_user 
if @article.save
# flash is a hash with key success it should be viewed so we write a view in appliction.erb view body
#flash would be shown after the page is redirected to article path 
flash[:success] = "Article has been created" 
redirect_to articles_path
else
	#flash.now due to how flash works it would render new templete then display the flash 
	#that will cause an issue if we typed the new path afterwards the flash wil be shown again
	#so we need .now to display th e flash once
	flash.now[:danger] = "Article has not been created"
	render :new
end
end

def show

end

def edit

end

def update

if @article.update(article_params)
flash[:success] = "Article has been updated"
# redirect to show article 
redirect_to @article 
else
flash.now[:danger] = "Article has not been updated"
render :edit
end
end

def destroy

if @article.destroy
flash[:success] = "Article has been deleted."
redirect_to articles_path 
end
end


 # override method from application controller which handle the not found exception
protected
def resource_not_found
message = "The article you are looking for could not be found" 
flash[:alert] = message
redirect_to root_path
end

# article_params is passed to new as it list info of article that is taken from the web while permiting title and body only
private

def set_article
@article = Article.find(params[:id])
end


def article_params
params.require(:article).permit(:title, :body) 
end
end
