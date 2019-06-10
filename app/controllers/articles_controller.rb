class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :destroy, :edit, :update]
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
			flash[:notice] = "Article was successfully created"
			redirect_to article_path(@article)
		else 
			render 'new'
			
		end
        #@article.save
        # redirect_to article_path(@article)
	end

	def show
		
	end

	def destroy
		@article.destroy
        flash[:notice] = "Article was successfully destroyed"
		redirect_to articles_path()
		
	end

	def edit 		
	end

	def update
		if @article.update(articles_params)
			flash[:notice]= "Article was successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
			
		end
		
	end

	private
	    def set_article
	    	@article = Article.find(params[:id])
	    	
	    end
	    def articles_params
	    	params.require(:article).permit(:title, :discription)
	    	
	    end
end