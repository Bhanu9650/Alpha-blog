class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :destroy, :edit, :update]
	before_action :require_user, except: [:show, :index]
	before_action :require_same_user, only: [:edit, :update, :destroy]
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
		@article.user = current_user
		#@article.user = User.first
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

	def require_same_user
		if current_user != @article.user and !current_user.admin?
			flash[:danger] = "You can edit or delete your own articles only"
			redirect_to root_path
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