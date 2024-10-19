class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new 
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 
    else
      @categories = Category.all
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path, notice: 
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    
    if @category.present?
     
      @category.tasks.destroy_all
      
      
      @category.destroy
      redirect_to categories_path, notice: 
    else
      redirect_to categories_path, alert: 
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
