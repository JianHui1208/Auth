class CategoryController < ApplicationController
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def show
        @category = Category.find(params[:id])
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to @categories
        else
            render :new
        end
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update_attributes(category_params)
            redirect_to @categories
        else
            render :edit
        end
    end

    def destroy
        @category = Category.find(params[:id])
        if @category.delete
            flash[:notice] = 'Category deleted!'   
            redirect_to @categories
        else
            flash[:error] = 'Failed to delete this category!'   
            redirect_to @categories
        end
    end

    def category_params
        params.require(:category).permit(:name)
    end
end
