class ArticlesController < ApplicationController
	def new
		@article = Article.new
		
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

	private
	    def articles_params
	    	params.require(:article).permit(:title, :discription)
	    	
	    end
end