class ArticlesController < ApplicationController
	def new
		@article = Article.new
		
	end

	def index
		@articles = Article.all
		
	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(articles_params)
		if @article.save
			flash[:notice] = "Your article is created"
			redirect_to article_path(@article)
		else 
			render 'new'
			
		end
        #@article.save
        # redirect_to article_path(@article)
	end

	def show
		@article = Article.find(params[:id])
		
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
        flash[:notice] = "Article was successfully destroyed"
		redirect_to articles_path()
		
	end

	def edit 
		@article = Article.find(params[:id])
		
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(articles_params)
			flash[:notice]= "Article was successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
			
		end
		
	end

	private
	    def articles_params
	    	params.require(:article).permit(:title, :discription)
	    	
	    end
end