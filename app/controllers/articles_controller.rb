class ArticlesController < ApplicationController
    before_action :findMethod, only:[:show,:edit, :update, :destroy]
    def show
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(properties)
        if @article.save
            redirect_to article_path(@article)
            flash[:notice] = "Article was created successfully!"
        else
            render 'new'
        end
    end

    def update

        if @article.update(properties)
            redirect_to @article
            flash[:notice] = "Article was updated successfuly!"
        else
            render 'edit'
        end
    end

    def destroy

        @article.destroy
        redirect_to articles_path
    end

    private

    def findMethod
        @article = Article.find(params[:id])
    end

    def properties
        params.require(:article).permit(:title, :description)
    end
end