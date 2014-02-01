class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  # GET /categories
  # GET /categories.json
  def index
    #@categories = Category.all
    @categories = Category.roots
    @header = "Lighting Products" 
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @header = @category.title
    if @category.is_childless?
      @products = @category.products
      
    else
      @categories = @category.children
      render action: 'index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end
    
end
