class CategoriesController < ApplicationController
    before_action :authenticate_admin, only: [:new, :edit, :update, :destroy]
    def new
      @category = Category.new
    end
    def edit
      @category = Category.find(params[:id])
    end
    def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
    end
    def create

      @category = Category.new(category_params)

      if @category.save
        redirect_to @category
      else
        render 'new'
      end
    end
    def show
      @category = Category.find(params[:id])
    end
    def index

        @categories = Category.all

    end
    def destroy
      @category = Category.find(params[:id])
      @category.destroy

      redirect_to categories_path
    end
    private
      def category_params
        params.require(:category).permit(:nama)
      end
  end
