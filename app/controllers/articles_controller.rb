class ArticlesController < ApplicationController

	def index
		@articles = Article.all
		if params[:title].present?
			@articles = @articles.where("title like ?", "%#{params[:title]}%")
		end
		if params[:content1].present?
			@articles = @articles.where("content1 like ?", "%#{params[:content1]}%")
		end
		if params[:content2].present?
			@articles = @articles.where("content2 like ?", "%#{params[:content2]}%")
		end
		
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to root_path
		else
			render :new
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to root_path
		else
			render :edit
	end
		
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to root_path
		
	end
	end
		
	end

	private

	def article_params
		params.require(:article).permit(:title, :content1, :content2, :content3, :content4)
		
	end
end
