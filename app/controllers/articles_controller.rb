class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :destroy, :edit, :update]
	def new
		@article = Article.new
		
	end

	def index
		@articles = Article.paginate(page: params[:page], per_page: 4)
		#paginate(page: params[:page], per_page: 5)
	end

	def create
		#render plain: params[:article].inspect
		#debugger
		@article = Article.new(articles_params)
		@article.user = User.first
		if @article.save
			flash[:success] = "Article was successfully created"
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
        flash[:danger] = "Article was successfully destroyed"
		redirect_to articles_path()
		
	end

	def edit 		
	end

	def update
		if @article.update(articles_params)
			flash[:success]= "Article was successfully updated"
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