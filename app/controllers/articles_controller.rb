class ArticlesController < ApplicationController

	http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

	def index
		@articles = Article.all
  	end

	def show
		   @article = Article.find(params[:id])
		   
  	end

	def new
  		@article = Article.new
	end

	def edit
  		@article = Article.find(params[:id])
	end

	def create
		# params[:article][:puid] = SecureRandom.hex(10);
		@article = Article.new(article_params)	 

	  	if @article.save
    		redirect_to articles_url
    		# @articles = Article.all
    		# render 'index'
    	else
    		render 'new'
  		end

  	end

  	def update
	  	@article = Article.find(params[:id])
	 
	  	if @article.update(article_params)
	    	redirect_to @article
		else
	    	render 'edit'
		end
	end

	def destroy
	  	@article = Article.find(params[:id])
	  	@article.destroy
	 
	  	redirect_to articles_url
	end

  	private
  		def article_params
    		params.require(:article).permit(:title, :text, :puid)
  		end

end
